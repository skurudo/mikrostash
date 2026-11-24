{
    # Set the outgoing SMTP account in Tools -> E-mail, then set the recipient here.
    :local emailTo "recipient@example.com"
    :if ($emailTo = "recipient@example.com" || [:len $emailTo] = 0) do={
        :error "Set emailTo to the backup recipient before running this script."
    }

    :local identity [/system identity get name]
    :local date [/system clock get date]
    :local time [/system clock get time]
    :local dailyName ($identity . "-" . [:pick $date 8 10] . "-" . [:pick $date 5 7] . "-" . [:pick $date 0 4])
    :local fileStem $dailyName
    :local suffix 1
    :while (([:len [/file find where name=($fileStem . ".backup")]] > 0) || ([:len [/file find where name=($fileStem . ".rsc")]] > 0)) do={
        :set suffix ($suffix + 1)
        :set fileStem ($dailyName . "-" . $suffix)
    }

    :local backupfile ($fileStem . ".backup")
    :local exportfile ($fileStem . ".rsc")
    /system backup save dont-encrypt=yes name=$backupfile
    :delay 5s
    /export file=$exportfile
    :delay 5s

    :local model [/system resource get board-name]
    :local arch [/system resource get architecture-name]
    :local subject "$time $date, Mikrotik $arch $model $identity"
    :local attachments {$backupfile;$exportfile}
    :for attempt from=1 to=2 do={
        :local mailStatus "failed"
        :do {
            /tool e-mail send to=$emailTo subject=$subject body=$subject file=$attachments
            :set mailStatus [/tool e-mail get last-status]
            :local waited 0
            :while ($mailStatus != "succeeded" && $mailStatus != "failed" && $waited < 30) do={
                :delay 1s
                :set waited ($waited + 1)
                :set mailStatus [/tool e-mail get last-status]
            }
        } on-error={
            :set mailStatus "failed"
        }

        :if ($mailStatus = "succeeded") do={
            /file remove $backupfile
            /file remove $exportfile
            :log info ("Backup email sent: " . $fileStem)
            :return []
        }
        :if ($mailStatus != "failed") do={
            :error ("Backup email status unconfirmed; files retained: " . $fileStem)
        }
        :if ($attempt = 1) do={
            :log warning "Backup email failed; retrying in 30 seconds."
            :delay 30s
        }
    }
    :error ("Backup email failed twice; files retained: " . $fileStem)
}

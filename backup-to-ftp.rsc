# copied from Evgeny a.k.a. ranzhe
# https://gist.github.com/ranzhe/8435acff931f73149db0
#
:local saveUserDB false
:local saveSysBackup true
:local encryptSysBackup false
:local saveRawExport true

:local FTPServer "ftp-server-name-or-IP"
:local FTPPort 21
:local FTPUser "ftp user"
:local FTPPass "ftp password"


:local ts [/system clock get time]
:set ts ([:pick $ts 0 2].[:pick $ts 3 5].[:pick $ts 6 8])

:local ds [/system clock get date]
:set ds ([:pick $ds 7 11].[:pick $ds 0 3].[:pick $ds 4 6])

:local fname ("BACKUP-".[/system identity get name]."-".$ds."-".$ts)
:local sfname ("/".$fname)

:if ($saveUserDB) do={
  /tool user-manager database save name=($sfname.".umb")
  :log info message="User Manager DB Backup Finished"
}

:if ($saveSysBackup) do={
  :if ($encryptSysBackup = true) do={ /system backup save name=($sfname.".backup") }
  :if ($encryptSysBackup = false) do={ /system backup save dont-encrypt=yes name=($sfname.".backup") }
  :log info message="System Backup Finished"
}

if ($saveRawExport) do={
  /export file=($sfname.".rsc")
  :log info message="Raw configuration script export Finished"
}

:local backupFileName ""

:foreach backupFile in=[/file find] do={
  :set backupFileName ("/".[/file get $backupFile name])
  :if ([:typeof [:find $backupFileName $sfname]] != "nil") do={
    /tool fetch address=$FTPServer port=$FTPPort src-path=$backupFileName user=$FTPUser mode=ftp password=$FTPPass dst-path=$backupFileName upload=yes
  }
}

:delay 5s

:foreach backupFile in=[/file find] do={
  :if ([:typeof [:find [/file get $backupFile name] "BACKUP-"]]!="nil") do={
    /file remove $backupFile
  }
}

:log info message="Successfully removed Temporary Backup Files"
:log info message="Automatic Backup Completed Successfully"
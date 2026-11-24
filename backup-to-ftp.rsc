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
:if ([:pick $ds 4 5] = "-") do={
  :set ds ([:pick $ds 0 4].[:pick $ds 5 7].[:pick $ds 8 10])
} else={
  :set ds ([:pick $ds 7 11].[:pick $ds 0 3].[:pick $ds 4 6])
}

:local fname ("BACKUP-".[/system identity get name]."-".$ds."-".$ts)
:local backupFiles [:toarray ""]

:if ($saveUserDB) do={
  /user-manager database save name=$fname
  :set backupFiles ($backupFiles,($fname.".umb"))
  :log info message="User Manager DB Backup Finished"
}

:if ($saveSysBackup) do={
  :if ($encryptSysBackup = true) do={ /system backup save name=($fname.".backup") }
  :if ($encryptSysBackup = false) do={ /system backup save dont-encrypt=yes name=($fname.".backup") }
  :set backupFiles ($backupFiles,($fname.".backup"))
  :log info message="System Backup Finished"
}

:if ($saveRawExport) do={
  /export file=($fname.".rsc")
  :set backupFiles ($backupFiles,($fname.".rsc"))
  :log info message="Raw configuration script export Finished"
}

:foreach backupFile in=$backupFiles do={
  /tool fetch address=$FTPServer port=$FTPPort src-path=$backupFile user=$FTPUser mode=ftp password=$FTPPass dst-path=("/".$backupFile) upload=yes
}

:foreach backupFile in=$backupFiles do={
  /file remove [find where name=$backupFile]
}

:log info message="Successfully removed Temporary Backup Files"
:log info message="Automatic Backup Completed Successfully"

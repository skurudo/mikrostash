# script legally copied from Sergey Muranov
# and evilly updated by Pavel Galkin
#
#Set E-mail to send (to send uses system E-mail account)
:local EaccountTo "who@email.to";


#Delete last backup(s)
:log info "Starting Backup Script...";
:local sysname [/system identity get name];
:local sysver [/system package get system version];
:log info "Deleting last Backups...";
:foreach i in=[/file find] do={:if ([:typeof [:find [/file get $i name] "$sysname-backup-"]]!="nil") do={/file remove $i}};
:delay 5;


#Create and send Full Backup
:local backupfile ("$sysname-backup-" . [:pick [/system clock get date] 7 11] . [:pick [/system clock get date] 0 3] . [:pick [/system clock get date] 4 6] . ".backup");
:log info "Creating new Full Backup file...";
/system backup save name=$backupfile;
:delay 10;
:log info "Sending Full Backup file via E-mail...";
/tool e-mail send to=$EaccountTo \
	file=$backupfile subject=("TrestVPNLand - $sysname Full Backup (" . [/system clock get date] . ")") \
	body=("$sysname full Backup file see in attachment. \nRouterOS version: $sysver.");
:delay 5;


#Create and send Setup Backup
:local exportfile ("$sysname-backup-" . [:pick [/system clock get date] 7 11] . [:pick [/system clock get date] 0 3] . [:pick [/system clock get date] 4 6] . ".rsc");
:log info "Creating new Setup Script file...";
/export file=$exportfile;
:delay 10;
:log info "Sending Setup Script file via E-mail...";
/tool e-mail send to=$EaccountTo \
	file=$exportfile subject=(" TrestVPNLand - $sysname Setup Script Backup (" . [/system clock get date] . ")") \
	body=("$sysname Setup Script file see in attachment. \nRouterOS version: $sysver.");
:delay 5;


#Finish
:log info "All System Backups emailed successfully.\nBackuping completed.";

#Delete all files in /
#/file remove [find] 
/file remove [find type="backup"]
/file remove [find type="script"]
/file remove [find type=".rif file"]
# originally created by Sergey Muranov
# evil telegram addition by Pavel Galkin ^_^''' 
#
#Set E-mail to send (to send uses system E-mail account)
:local EaccountTo "your-email";
:global sendToTele "https://api.telegram.org/bot-info/sendmessage\?chat_id=your-channel&text=";

#Check for updates
/system package update check-for-updates

#Get values
:local Installed [/system package update get installed-version];
:local Latest [/system package update get latest-version];
:local Channel [/system package update get channel];

#Checking
if ($Installed != $Latest) do={
/tool fetch url="$sendToTele $[/system identity get name]: Firmware Update%0AInstalled-version: $Installed%0ALatest-version: $Latest%0AChannel: $Channel"  keep-result=no;
/tool e-mail send to=$EaccountTo subject=("$[/system identity get name]: Firmware Update") body=("Installed-version: $Installed\nLatest-version: $Latest\nChannel: $Channel");
}
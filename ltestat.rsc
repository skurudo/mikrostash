# creds for bot
:global sendToTele "https://api.telegram.org/BOTID/sendmessage\?chat_id=ChannelID&text=";

# get lte status - check for registration-status
:put [/interface lte info lte1 once as-value];
:local rstat (:put ([/interface lte info lte1 once as-value ]->"registration-status"));

# else-if section
:if  ( $rstat  != "registered" ) do={
/log info "LTE Failed You, restarting"
/interface disable lte1
/delay 5s
/interface enable lte1
/delay 25s
/tool fetch url="$sendToTele MTS Failed on Fazenda-AIR - Modem just reconnected"  keep-result=no;
} else {:log info "LTE Status - Good"}


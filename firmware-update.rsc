:log info "Checking firmware...";
/system routerboard
:if ([get current-firmware] != [get upgrade-firmware]) do={
     :log info "Updating firmware";
     upgrade;
    # wait a litte before reboot	
    # :delay 30s;
    /system reboot;
     } else={
     :log info "No update."
     }
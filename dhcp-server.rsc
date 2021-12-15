:if ($leaseBound = 1) do={
	/ip dhcp-server lease;
	:foreach i in=[find dynamic=yes] do={
		:local dhcpip 
		:set dhcpip [ get $i address ];
		:local clientid
		:set clientid [get $i host-name];
 
		:if ($leaseActIP = $dhcpip) do={
			:local comment "New IP"
			:set comment ( $comment . ": " .  $dhcpip . ": " . $clientid);
			/log error $comment; 
			/tool fetch url="https://api.telegram.org/BOTID/sendmessage\?chat_id=CHATID&text=IP: $leaseActIP - $leaseActMAC%0ADeviceName:$clientid%0ADHCP-Server: $leaseServerName" keep-result=no
		}
	}
}

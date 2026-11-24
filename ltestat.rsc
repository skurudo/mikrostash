{
    :local lteName "lte1"
    :local botToken "BOT_TOKEN"
    :local chatId "CHAT_ID"

    :local ifaceId [/interface find where name=$lteName and type="lte"]
    :if ([:len $ifaceId] = 0) do={
        :log warning ("LTE: interface " . $lteName . " not found")
        :return []
    }
    :if ([/interface get $ifaceId disabled]) do={
        :log info ("LTE: " . $lteName . " is administratively disabled")
        :return []
    }

    :local readState do={
        :local rawState
        :do {
            :set rawState ([/interface lte monitor $1 once as-value]->"status")
        } on-error={
            :log warning ("LTE: cannot read status from " . $1)
            :return "unconfirmed"
        }
        :if ($rawState = "connected") do={ :return "connected" }
        :if (($rawState = "disconnected") || ($rawState = "deregistered") || ($rawState = "denied")) do={
            :return "disconnected"
        }
        :log info ("LTE: status of " . $1 . " is inconclusive (" . $rawState . ")")
        :return "unconfirmed"
    }

    :local before [$readState $lteName]
    :if ($before = "connected") do={
        :log info ("LTE: " . $lteName . " is connected")
    }
    :if ($before != "disconnected") do={ :return [] }

    :log warning ("LTE: " . $lteName . " is disconnected, restarting interface")
    :local outcome "restart-failed"
    :do {
        /interface disable $ifaceId
        :delay 5s
        :do { /interface enable $ifaceId } on-error={
            :delay 5s
            /interface enable $ifaceId
        }
        :delay 25s
        :set outcome [$readState $lteName]
        :if ($outcome = "connected") do={ :set outcome "restored" }
    } on-error={
        :log error ("LTE: could not restart " . $lteName)
    }
    :log info ("LTE: " . $lteName . " recovery result: " . $outcome)
    :if (($botToken != "BOT_TOKEN") && ($chatId != "CHAT_ID")) do={
        :do {
            :local telegramUrl ("https://api.telegram.org/bot" . $botToken . "/sendMessage?chat_id=" . $chatId . "&text=LTE%20recovery%20result%3A%20" . $outcome)
            /tool fetch url=$telegramUrl keep-result=no
        } on-error={
            :log warning "LTE: Telegram notification failed"
        }
    }
}

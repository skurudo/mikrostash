# LTE connection recovery on RouterOS 7

[ltestat.rsc](ltestat.rsc) reads the interface status with `/interface lte monitor`. It restarts the interface only when the reported status is `disconnected`, `deregistered`, or `denied`. If the interface is missing or administratively disabled, the status cannot be read, or the state is unknown, the script logs the reason and exits.

To restart the interface, the script disables it for 5 seconds, enables it, then checks the connection again after 25 seconds. It logs the recovery result in RouterOS and sends it to Telegram if bot notifications are configured.

## Setup

1. At the top of the script, set `lteName` to the name of the LTE interface. The default is `lte1`.
2. To enable notifications, replace `BOT_TOKEN` in `botToken` with the bot token and `CHAT_ID` in `chatId` with the destination chat ID.
3. Run the script manually or schedule it under **System → Scheduler**.

[Русский](ltestat_DESCRIPTION.md)

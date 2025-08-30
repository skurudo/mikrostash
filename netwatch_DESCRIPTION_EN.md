# netwatch.rsc - Script Description

## Purpose
**netwatch.rsc** is a script for monitoring network host availability with Telegram notifications.

## Functionality
- Monitoring availability of host 77.88.8.8 (Yandex DNS)
- Sending Telegram notifications when host is unavailable
- Sending notifications when availability is restored
- Configuring host description for notifications

## Configuration Parameters
- **BOTID** - Telegram bot ID (requires replacement)
- **CHANNEL-ID** - Telegram channel/group ID (requires replacement)
- **host** - IP address of monitored host
- **down-script** - Script when host is unavailable
- **up-script** - Script when host availability is restored

## Requirements
- Configured Telegram Bot
- Obtained Chat ID of channel/group
- Internet access for sending notifications

## Usage
1. Create a bot through @BotFather
2. Get Chat ID of your group/channel
3. Replace BOTID and CHANNEL-ID in the script
4. Add to Netwatch for automatic monitoring

## Features
- Monitors Yandex DNS server by default
- Sends notifications in Russian
- Includes router name in notifications

---
[English](netwatch_DESCRIPTION_EN.md) | [Русский](netwatch_DESCRIPTION.md)

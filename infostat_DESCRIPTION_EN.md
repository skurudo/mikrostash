# infostat.rsc - Script Description

## Purpose
**infostat.rsc** is a script for collecting and sending MikroTik device statistics to Telegram.

## Functionality
- Collecting device temperature information
- Monitoring power supply voltage
- Tracking uptime
- CPU load monitoring
- Memory statistics collection
- Traffic volume tracking (download/upload)
- Sending reports to Telegram

## Configuration Parameters
- **BOTID** - Telegram bot ID (requires replacement)
- **GROUPID** - Telegram group ID (requires replacement)
- **PORT** - Port for traffic monitoring (default: ether1)

## Requirements
- Configured Telegram Bot
- Obtained Chat ID of group
- Internet access for sending notifications
- MikroTik device with health monitoring support

## Usage
1. Create a bot through @BotFather
2. Get Chat ID of your group
3. Replace BOTID and GROUPID in the script
4. Change port for monitoring if necessary
5. Run manually or add to scheduler

## Features
- Automatically converts bytes to gigabytes
- Formats voltage with two decimal places
- Includes RouterOS version in report
- Sends information in Russian

---
[English](infostat_DESCRIPTION_EN.md) | [Русский](infostat_DESCRIPTION.md)

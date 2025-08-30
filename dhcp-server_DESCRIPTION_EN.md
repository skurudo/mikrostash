# dhcp-server.rsc - Script Description

## Purpose
**dhcp-server.rsc** is a script for sending Telegram notifications when new DHCP leases are issued.

## Functionality
- Monitoring new DHCP leases
- Sending Telegram notifications
- Including IP address information
- Including client name (host-name)
- Logging events to system journal

## Configuration Parameters
- **BOTID** - Telegram bot ID (requires replacement)
- **CHATID** - Telegram chat ID (requires replacement)
- **leaseServerName** - DHCP server name for notifications

## Requirements
- Configured Telegram Bot
- Obtained Chat ID
- Configured DHCP server
- Internet access for sending notifications

## Usage
1. Create a bot through @BotFather
2. Get Chat ID
3. Replace BOTID and CHATID in the script
4. Add as script for DHCP lease bound events

## Features
- Triggers when DHCP lease is bound
- Sends information about new IP address
- Includes client name from DHCP
- Logs events to system journal

---
[English](dhcp-server_DESCRIPTION_EN.md) | [Русский](dhcp-server_DESCRIPTION.md)

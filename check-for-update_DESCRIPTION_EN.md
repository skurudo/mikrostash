# check-for-update.rsc - Script Description

## Purpose
**check-for-update.rsc** is a script for checking MikroTik RouterOS update availability.

## Functionality
- Checking for new RouterOS versions
- Comparing current version with available ones
- Sending notifications about available updates
- Logging check results
- Support for various update channels

## Configuration Parameters
- **updateChannel** - Update channel to check
- **notifyEmail** - Email for update notifications
- **checkInterval** - Update check interval
- **autoDownload** - Automatic update download

## Requirements
- RouterOS version 6.43.7 or higher
- Internet access for checking updates
- Configured Email settings (for notifications)
- Sufficient space for temporary files

## Usage
1. Configure check parameters at the beginning of the script
2. Copy the script to your device
3. Add to scheduler for regular checking
4. Configure Email for receiving notifications

## Features
- Safe checking without installing updates
- Supports Email notifications
- Can configure various update channels
- Recommended to run regularly

---
[English](check-for-update_DESCRIPTION_EN.md) | [Русский](check-for-update_DESCRIPTION.md)

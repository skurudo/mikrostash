# firmware-update.rsc - Script Description

## Purpose
**firmware-update.rsc** is a script for automatic firmware update of MikroTik RouterOS.

## Functionality
- Automatic checking for update availability
- Installing new firmware versions
- Creating backups before update
- Logging update process

## Configuration Parameters
- **updateChannel** - Update channel (stable, long-term, testing)
- **autoReboot** - Automatic reboot after update
- **backupBeforeUpdate** - Create backup before update

## Requirements
- RouterOS version 6.43.7 or higher
- Internet access for downloading updates
- Sufficient space for new firmware files
- Stable power supply

## Usage
1. Configure update parameters at the beginning of the script
2. Copy the script to your device
3. Run manually or add to scheduler
4. Ensure stable power supply before running

## Features
- Recommended to run during off-hours
- Requires stable internet connection
- Update process may take several minutes
- Automatic reboot after completion

---
[English](firmware-update_DESCRIPTION_EN.md) | [Русский](firmware-update_DESCRIPTION.md)

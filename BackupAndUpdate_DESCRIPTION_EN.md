# BackupAndUpdate.rsc - Script Description

## Purpose
**BackupAndUpdate.rsc** is the main script for automatic backup and update of MikroTik RouterOS.

## Functionality
- Automatic creation of configuration backups
- Checking for RouterOS update availability
- Automatic system update (optional)
- Email notifications
- Backup encryption (optional)
- Support for various update channels (stable, long-term, testing, development)

## Configuration Parameters
- **emailAddress** - Email address for notifications
- **scriptMode** - Operation mode (backup, osupdate, osnotify)
- **forceBackup** - Force backup creation
- **backupPassword** - Password for backup encryption
- **updateChannel** - Update channel
- **installOnlyPatchUpdates** - Install only patch updates

## Requirements
- RouterOS version 6.43.7 or higher
- Configured Email settings in Tools -> Email
- Set device name (System -> Identity)

## Usage
1. Copy the script to your device
2. Configure parameters at the beginning of the script
3. Add to task scheduler for automatic execution

## Security
- Creates backups before updating
- Supports backup encryption
- Checks Email settings correctness

## Author
Alexander Tebiev (tebiev@mail.com)
Version: 21.09.27
Last Updated: 27/09/2021

---
[English](BackupAndUpdate_DESCRIPTION_EN.md) | [Русский](BackupAndUpdate_DESCRIPTION.md)

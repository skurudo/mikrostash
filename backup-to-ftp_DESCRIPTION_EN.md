# backup-to-ftp.rsc - Script Description

## Purpose
**backup-to-ftp.rsc** is a script for automatic backup of MikroTik configuration to FTP server.

## Functionality
- Creation of configuration backups
- Automatic upload to FTP server
- FTP authentication support
- Temporary file creation for upload
- Automatic cleanup of temporary files

## Configuration Parameters
- **ftpServer** - FTP server address
- **ftpUser** - FTP username
- **ftpPass** - FTP password
- **ftpPath** - Path on FTP server for saving
- **backupName** - Backup file name

## Requirements
- Access to FTP server
- Configured FTP credentials
- Sufficient space on FTP server

## Usage
1. Configure FTP parameters at the beginning of the script
2. Copy the script to your device
3. Run manually or add to scheduler

## Features
- Creates temporary files in /flash/rw/
- Automatically removes temporary files after upload
- Supports standard FTP commands

---
[English](backup-to-ftp_DESCRIPTION_EN.md) | [Русский](backup-to-ftp_DESCRIPTION.md)

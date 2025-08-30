# backup-to-email.rsc - Script Description

## Purpose
**backup-to-email.rsc** is a script for automatic sending of MikroTik configuration backups via email.

## Functionality
- Creation of configuration backups
- Automatic email sending
- Email attachment support
- Email subject and body customization
- Automatic cleanup of temporary files

## Configuration Parameters
- **emailTo** - Recipient email address
- **emailSubject** - Email subject
- **emailBody** - Email body text
- **backupName** - Backup file name
- **includePasswords** - Include passwords in configuration

## Requirements
- Configured Email settings in Tools -> Email
- SMTP server with attachment support
- Sufficient space for temporary files

## Usage
1. Configure email parameters at the beginning of the script
2. Ensure Email is configured in Tools -> Email
3. Copy the script to your device
4. Run manually or add to scheduler

## Features
- Creates temporary files in /flash/rw/
- Automatically removes temporary files after sending
- Supports HTML formatting in email

---
[English](backup-to-email_DESCRIPTION_EN.md) | [Русский](backup-to-email_DESCRIPTION.md)

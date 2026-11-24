# MikroStash - MikroTik RouterOS Scripts Collection

[English](README_EN.md) | [Русский](README.md)

## Project Description

**MikroStash** is a collection of useful scripts for automating and monitoring MikroTik RouterOS devices.

## Scripts

### 🔄 Backup
- **[BackupAndUpdate.rsc](BackupAndUpdate.rsc)** - Automatic backup and RouterOS update. Creates configuration backups and automatically updates the system when new versions are available. 📖 [Description](BackupAndUpdate_DESCRIPTION_EN.md) | [Описание](BackupAndUpdate_DESCRIPTION.md)
- **[backup-to-ftp.rsc](backup-to-ftp.rsc)** - Configuration backup to FTP server. Sends automatic backup copies to a remote FTP server for secure storage. 📖 [Description](backup-to-ftp_DESCRIPTION_EN.md) | [Описание](backup-to-ftp_DESCRIPTION.md)
- **[backup-to-email.rsc](backup-to-email.rsc)** - Sending backup copies via email. Automatically sends configuration backup copies to the specified email address. 📖 [Description](backup-to-email_DESCRIPTION_EN.md) | [Описание](backup-to-email_DESCRIPTION.md)

### 📡 Monitoring
- **[netwatch.rsc](netwatch.rsc)** - Host availability monitoring. Tracks network host availability and sends Telegram notifications when connection issues occur. 📖 [Description](netwatch_DESCRIPTION_EN.md) | [Описание](netwatch_DESCRIPTION.md)
- **[infostat.rsc](infostat.rsc)** - Device statistics collection. Collects information about temperature, load, traffic and sends reports to Telegram for device status monitoring. 📖 [Description](infostat_DESCRIPTION_EN.md) | [Описание](infostat_DESCRIPTION.md)

### 🌐 DHCP
- **[dhcp-server.rsc](dhcp-server.rsc)** - DHCP lease notifications. Sends Telegram notifications when new IP addresses are issued to DHCP clients for connection tracking. 📖 [Description](dhcp-server_DESCRIPTION_EN.md) | [Описание](dhcp-server_DESCRIPTION.md)

### 🔧 Updates
- **[firmware-update.rsc](firmware-update.rsc)** - Automatic firmware update. Checks and installs available RouterOS firmware updates automatically. 📖 [Description](firmware-update_DESCRIPTION_EN.md) | [Описание](firmware-update_DESCRIPTION.md)
- **[check-for-update.rsc](check-for-update.rsc)** - Update checking. Checks for new RouterOS versions and notifies the administrator about available updates. 📖 [Description](check-for-update_DESCRIPTION_EN.md) | [Описание](check-for-update_DESCRIPTION.md)

### ⚡ Additional Functions
- **[ltestat.rsc](ltestat.rsc)** - Checks the LTE connection and restarts the interface if it reports a disconnected state. 📖 [Description](ltestat_DESCRIPTION_EN.md) | [Описание](ltestat_DESCRIPTION.md)

### 🎵 Entertainment
- **[music-imperial-march.rsc](music-imperial-march.rsc)** - Playing "Imperial March". Plays the melody through the device's built-in speaker to demonstrate capabilities. 📖 [Description](music-imperial-march_DESCRIPTION_EN.md) | [Описание](music-imperial-march_DESCRIPTION.md)

## Requirements

- The updated backup and LTE scripts require RouterOS 7. `backup-to-email.rsc` requires 7.10 or later.
- For email scripts, configure the SMTP account in WinBox under **Tools → E-mail** and set the recipient in the script.
- Telegram Bot API (for scripts with Telegram notifications)

## Installation

1. Copy the required scripts to your MikroTik device
2. Configure parameters at the beginning of each script (email, Telegram Bot ID, Chat ID)
3. Add scripts to the task scheduler for automatic execution

## License

The project is distributed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file.

---

**Author:** [skurudo](https://github.com/skurudo)  
**Version:** 2.0  
**Last Updated:** 2024

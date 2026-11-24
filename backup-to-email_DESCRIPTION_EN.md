# Email MikroTik backups

[backup-to-email.rsc](backup-to-email.rsc) for RouterOS 7.10 and later sends two attachments in one email. The `.backup` file is an unencrypted binary backup, and the `.rsc` file contains the configuration produced by the standard `/export` command.

## Setup and use

1. In WinBox, open **Tools → E-mail**. Enter the SMTP server address, port and **From** address. Select the TLS mode required by your provider. If the server requires authentication, enter the username and password. RouterOS stores the SMTP password in its **E-mail** settings.
2. At the top of the script, replace `recipient@example.com` in `emailTo` with the recipient’s address.
3. Run the script manually or add it to **System → Scheduler** to send backups on a schedule.

Both filenames include the date in `DD-MM-YYYY` format. If a name is already in use, the script adds a suffix to both new filenames.

If sending fails, the script retries once after 30 seconds. After a successful send, it deletes only the two files created during that run. If both attempts fail or RouterOS cannot confirm the result within 30 seconds, both files stay on the router.

[Русский](backup-to-email_DESCRIPTION.md)

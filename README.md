# MikroStash - Коллекция скриптов для MikroTik RouterOS

[English](README_EN.md) | [Русский](README.md)

## Описание проекта

**MikroStash** - это коллекция полезных скриптов для автоматизации и мониторинга устройств MikroTik RouterOS.

## Скрипты

### 🔄 Резервное копирование
- **[BackupAndUpdate.rsc](BackupAndUpdate.rsc)** - Автоматическое резервное копирование и обновление RouterOS. Создает резервные копии конфигурации и автоматически обновляет систему при наличии новых версий. 📖 [Подробное описание](BackupAndUpdate_DESCRIPTION.md) | [Description](BackupAndUpdate_DESCRIPTION_EN.md)
- **[backup-to-ftp.rsc](backup-to-ftp.rsc)** - Резервное копирование конфигурации на FTP сервер. Отправляет автоматические резервные копии на удаленный FTP сервер для безопасного хранения. 📖 [Подробное описание](backup-to-ftp_DESCRIPTION.md) | [Description](backup-to-ftp_DESCRIPTION_EN.md)
- **[backup-to-email.rsc](backup-to-email.rsc)** - Отправка резервных копий по email. Автоматически отправляет резервные копии конфигурации на указанный email адрес. 📖 [Подробное описание](backup-to-email_DESCRIPTION.md) | [Description](backup-to-email_DESCRIPTION_EN.md)

### 📡 Мониторинг
- **[netwatch.rsc](netwatch.rsc)** - Мониторинг доступности хостов. Отслеживает доступность сетевых хостов и отправляет уведомления в Telegram при проблемах с соединением. 📖 [Подробное описание](netwatch_DESCRIPTION.md) | [Description](netwatch_DESCRIPTION_EN.md)
- **[infostat.rsc](infostat.rsc)** - Сбор статистики устройства. Собирает информацию о температуре, нагрузке, трафике и отправляет отчеты в Telegram для мониторинга состояния устройства. 📖 [Подробное описание](infostat_DESCRIPTION.md) | [Description](infostat_DESCRIPTION_EN.md)

### 🌐 DHCP
- **[dhcp-server.rsc](dhcp-server.rsc)** - Уведомления о DHCP-арендах. Отправляет уведомления в Telegram при выдаче новых IP-адресов DHCP-клиентам для отслеживания подключений. 📖 [Подробное описание](dhcp-server_DESCRIPTION.md) | [Description](dhcp-server_DESCRIPTION_EN.md)

### 🔧 Обновления
- **[firmware-update.rsc](firmware-update.rsc)** - Автоматическое обновление прошивки. Проверяет и устанавливает доступные обновления прошивки RouterOS автоматически. 📖 [Подробное описание](firmware-update_DESCRIPTION.md) | [Description](firmware-update_DESCRIPTION_EN.md)
- **[check-for-update.rsc](check-for-update.rsc)** - Проверка обновлений. Проверяет наличие новых версий RouterOS и уведомляет администратора о доступных обновлениях. 📖 [Подробное описание](check-for-update_DESCRIPTION.md) | [Description](check-for-update_DESCRIPTION_EN.md)

### ⚡ Дополнительные функции
- **[ltestat.rsc](ltestat.rsc)** - Проверяет состояние LTE и перезапускает интерфейс при подтверждённом отключении. 📖 [Подробное описание](ltestat_DESCRIPTION.md) | [Description](ltestat_DESCRIPTION_EN.md)

### 🎵 Развлечения
- **[music-imperial-march.rsc](music-imperial-march.rsc)** - Воспроизведение "Имперского марша". Воспроизводит мелодию через встроенный динамик устройства для демонстрации возможностей. 📖 [Подробное описание](music-imperial-march_DESCRIPTION.md) | [Description](music-imperial-march_DESCRIPTION_EN.md)

## Требования

- Для обновлённых скриптов резервного копирования и LTE нужна RouterOS 7. Для `backup-to-email.rsc` нужна версия 7.10 или новее.
- Для почтовых скриптов настройте SMTP в WinBox в разделе **Tools → E-mail** и укажите получателя в самом скрипте.
- Telegram Bot API (для скриптов с Telegram-уведомлениями)

## Установка

1. Скопируйте нужные скрипты на ваше устройство MikroTik
2. Настройте параметры в начале каждого скрипта (email, Telegram Bot ID, Chat ID)
3. Добавьте скрипты в планировщик задач для автоматического выполнения

## Лицензия

Проект распространяется под лицензией GNU General Public License v3.0. См. файл [LICENSE](LICENSE).

---

Местами **автор** и тестировщик:  [skurudo](https://github.com/skurudo)  
**Версия:** 2.0  
**Последнее обновление:** 2024

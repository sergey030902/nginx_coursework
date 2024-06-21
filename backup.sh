#!/bin/bash

# Папки для резервного копирования
WEB_DIR="/var/www/html/mywebsite/lab2"
NGINX_CONF_DIR="/etc/nginx"

# Директория для хранения резервных копий
BACKUP_DIR="/home/sergey/backups"

# Срок хранения резервных копий в днях
RETENTION_DAYS=7

# Создание директории для резервных копий, если её нет
mkdir -p $BACKUP_DIR

# Текущая дата
DATE=$(date +%Y%m%d%H%M%S)

# Создание резервных копий
rsync -av --delete $WEB_DIR $BACKUP_DIR/web_backup_$DATE
rsync -av --delete $NGINX_CONF_DIR $BACKUP_DIR/nginx_backup_$DATE

# Удаление резервных копий, старше RETENTION_DAYS дней
find $BACKUP_DIR -type d -name 'web_backup_*' -mtime +$RETENTION_DAYS -exec rm -rf {} \;
find $BACKUP_DIR -type d -name 'nginx_backup_*' -mtime +$RETENTION_DAYS -exec rm -rf {} \;

# Сообщение о завершении
echo "Резервное копирование завершено. Файлы сохранены в $BACKUP_DIR"


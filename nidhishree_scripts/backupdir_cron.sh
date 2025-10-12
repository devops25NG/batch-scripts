#!/bin/bash

SOURCE_DIR="/home/ec2-user/dir2"        
BACKUP_DIR="/home/ec2-user/backup_dir2"     
DATE=$(date +%Y-%m-%d)                  
BACKUP_FILE="$BACKUP_DIR/backup-$DATE.tar.gz"

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

echo "[$(date)] Starting backup..." >> /home/ec2-user/backup.log

tar -czf "$BACKUP_FILE" "$SOURCE_DIR" >> /home/ec2-user/backup.log 2>&1       # 2>&1  “redirect the error output(2) to the same place as normal output(1)”

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup successful: $BACKUP_FILE" >> /home/ec2-user/backup.log
else
    echo "[$(date)] Backup failed!" >> /home/ec2-user/backup.log
fi


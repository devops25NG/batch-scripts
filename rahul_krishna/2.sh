#!/bin/bash

RAM_LIMIT=80
DISK_LIMIT=15
EMAIL="admin@example.com"
time=$(date +"%A, %d %B %Y, %I:%M %p")

RAM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

MSG=""

if [ "$RAM" -ge "$RAM_LIMIT" ]; then
    MSG+="RAM usage: $RAM%\n please take action $time"
fi

if [ "$DISK" -ge "$DISK_LIMIT" ]; then
    MSG+="Disk usage: $DISK%\n please take action $time"
fi

if [ -n "$MSG" ]; then
    echo -e "$MSG" | mail -s "Resource Alert: $(hostname)" "$EMAIL"
fi

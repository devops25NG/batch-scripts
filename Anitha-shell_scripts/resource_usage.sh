#!/bin/bash

# Thresholds
DISK_LIMIT=1
RAM_LIMIT=1

# Your email
EMAIL="anithabh83@gmail.com"

# Temp file for warnings
TEMP="/tmp/sys_warn.txt"
> $TEMP

# Check disk usage

disk=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ $disk -ge $DISK_LIMIT ]; then
    echo "Disk usage is high: $disk%" >> $TEMP
fi

# Check RAM usage

ram=$(free | awk '/Mem:/ {print int(($3/$2)*100)}')
if [ $ram -ge $RAM_LIMIT ]; then
    echo "RAM usage is high: $ram%" >> $TEMP
fi

# Send email if there are warnings
if [ -s $TEMP ]; then
    mail -s "System Warning" $EMAIL < $TEMP
fi


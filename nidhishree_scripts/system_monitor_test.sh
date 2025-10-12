#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

EMAIL="darni.nidhi@gmail.com"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d'.' -f1)
MEM_USAGE=$(free | awk '/Mem/{printf("%.0f"), $3/$2*100}')
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

MESSAGE="System Resource Alert on $(hostname):\n\n"

ALERT=0

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    MESSAGE+="! CPU usage is at ${CPU_USAGE}% (Threshold: ${CPU_THRESHOLD}%)\n"
    ALERT=1
fi

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    MESSAGE+="! Memory usage is at ${MEM_USAGE}% (Threshold: ${MEM_THRESHOLD}%)\n"
    ALERT=1
fi

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    MESSAGE+="! Disk usage is at ${DISK_USAGE}% (Threshold: ${DISK_THRESHOLD}%)\n"
    ALERT=1
fi

if [ $ALERT -eq 1 ]; then
    echo -e "$MESSAGE" | mail -s "System Resource Alert on $(hostname)" "$EMAIL"
    echo "Alert mail sent to $EMAIL"
else
    echo "All resources are under control "
fi


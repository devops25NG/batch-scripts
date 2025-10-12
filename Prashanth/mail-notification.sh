#!/bin/bash

mailid="prashanthprashu7160@gmail.com"
subject="System Resource Alert on $(hostname)"
LOGFILE="/tmp/system_monitor.log"

RAM_THRESHOLD=15
DISK_THRESHOLD=15

Ram=$(free | awk '/Mem/ { printf("Memory Usage: %.2f%%\n", $3/$2 * 100.0)}')
Disk=$(df / | awk 'NR==2 {printf("Disk Usage:" $5)}')

Ram_value=$(free | awk '/Mem/ { printf("%.0f", $3/$2 * 100.0)}')
Disk_value=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo '' > $LOGFILE

if [ $Ram_value -gt $RAM_THRESHOLD ] || [ $Disk_value -gt $DISK_THRESHOLD ]; then
    echo "System Performance Report - $(date)" >> $LOGFILE
    echo >> $LOGFILE
    echo "$Ram" >> $LOGFILE
    echo "$Disk" >> $LOGFILE
    echo >> $LOGFILE
    echo "Thank you" >> $LOGFILE
    
    cat "$LOGFILE" | mail -s "$subject" "$mailid"
fi


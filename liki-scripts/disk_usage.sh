#!/bin/bash

# ==== Configuration ====
TO="likithasp02@gmail.com"          
SUBJECT="⚠ System Resource Alert - $(hostname)"
LOGFILE="/tmp/system_monitor.log"

# ==== Thresholds ====
CPU_THRESHOLD=20
MEM_THRESHOLD=20
DISK_THRESHOLD=20

#functions call
check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    CPU_USAGE=${CPU_USAGE%.*}
    if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
        echo "High CPU usage detected: ${CPU_USAGE}%" >> "$LOGFILE"
    fi
}

check_memory() {
    MEM_USAGE=$(free | awk '/Mem/{printf("%.0f"), $3/$2*100}')
    if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
        echo "High Memory usage detected: ${MEM_USAGE}%" >> "$LOGFILE"
    fi
}

check_disk() {
    DISK_USAGE=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')
    if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
        echo "High Disk usage detected on / : ${DISK_USAGE}%" >> "$LOGFILE"
    fi
}

send_mail() {
    if [ -s "$LOGFILE" ]; then
        echo "Sending system alert email to $TO..."
        mail -s "$SUBJECT" "$TO" < "$LOGFILE"
        # Clear log after sending
        > "$LOGFILE"
    fi
}

# ==== Main Execution ====
> "$LOGFILE"
check_cpu
check_memory
check_disk
send_mail

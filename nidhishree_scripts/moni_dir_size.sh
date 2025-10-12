#!/bin/bash

DIR_TO_MONITOR="/home/ec2-user/dir2"
THRESHOLD=100

THRESHOLD_KB=$((THRESHOLD * 1024))

check_size() {
    DIR_SIZE_KB=$(du -s "$DIR_TO_MONITOR" 2>/dev/null | awk '{print $1}')

    if [ -z "$DIR_SIZE_KB" ]; then
        echo "Directory $DIR_TO_MONITOR does not exist!"
        exit 1
    fi

    if [ "$DIR_SIZE_KB" -ge "$THRESHOLD_KB" ]; then
        echo "⚠️ ALERT: Directory $DIR_TO_MONITOR size $(($DIR_SIZE_KB / 1024)) MB exceeds threshold of $THRESHOLD MB"
    else
        echo "Directory $DIR_TO_MONITOR size is within limit: $(($DIR_SIZE_KB / 1024)) MB"
    fi
}

check_size

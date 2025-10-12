#!/bin/bash

TARGET_DIR="/home/ec2-user/dir2"
ARCHIVE_DIR="/home/ec2-user/archive_old"
DAYS=7

mkdir -p "$ARCHIVE_DIR"

FILELIST=$(mktemp)
find "$TARGET_DIR" -type f -mtime +$DAYS > "$FILELIST"

if [ ! -s "$FILELIST" ]; then
    echo "No files older than $DAYS days found."
    rm -f "$FILELIST"
    exit 0
fi

ARCHIVE_NAME="$ARCHIVE_DIR/old_files_$(date +%Y%m%d_%H%M%S).tar.gz"
tar -czf "$ARCHIVE_NAME" -T "$FILELIST"

if [ $? -eq 0 ]; then
    xargs rm -f < "$FILELIST"
    echo "Successfully compressed files into $ARCHIVE_NAME"
else
    echo "Compression failed!"
fi

rm -f "$FILELIST"


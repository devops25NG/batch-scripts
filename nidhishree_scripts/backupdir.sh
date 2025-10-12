#!/bin/bash

if [ $# -ne 2 ]; then
    echo "usage: $0 <source_directory> <backup_directory>"
	exit 1
fi

source_dir=$1
backup_dir=$2

if [ ! -d "$source_dir" ]; then
    echo "source directory $source_dir does not exists."
	exit 1
fi

mkdir -p "$backup_dir"

TIMESTAMP=$(date "+%Y%m%d-%H-%M-%S")

BACKUP_FILE="$backup_dir/backup-$TIMESTAMP.tar.gz"

echo "creating a backup of $source_dir at $BACKUP_FILE"
tar -czf "$BACKUP_FILE" -c "$source_dir"

if [ $? -eq 0 ]; then
   echo "backup completed successfully: $BACKUP_FILE"
else
   echo "backup failed"
   exit 1
fi

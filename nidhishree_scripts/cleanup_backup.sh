#!/bin/bash
 
 if [ $# -ne 3 ]; then
    echo "usage: $0 <directory> <days> <backup_directory>"
	exit 1
fi

target_dir=$1
days=$2
backup_dir=$3


if [ ! -d "$target_dir" ]; then
   echo "the directory $target_dir does not exists"
   exit 1
fi

mkdir -p "$backup_dir"

TIMESTAMP=$(date +%Y%m%d-%H-%M-%S)
BACKUP_FILE="$backup_dir/backup_old_file-$TIMESTAMP.tar.gz"

echo "backing up files older then $days ...."
find "$target_dir" -type f -mtime +$days -exec ls -S {} + | tar -czf "$BACKUP_FILE" -T -

if [ $? -eq 0 ]; then
    echo "backup completed successfully: $BACKUP_FILE"
else
    echo "backup failed. aborting deletion"
    exit 1
fi

echo "deleting files older than $days.."
find "$target_dir" -type f -mtime +$days ls -S {} + | xargs -d '\n' rm -f

echo "cleanup complete"

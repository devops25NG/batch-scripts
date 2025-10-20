#!/bin/bash
 
# Directory to backup (change this)
SOURCE_DIR="/home/ec2-user/shell_script_assignment"
 
# Directory where backups will be stored
BACKUP_DIR="/home/ec2-user/shell_script_assignment/backups"
 
# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR
 
# Get current date in YYYY-MM-DD format (used for versioning)
DATE=$(date +%Y-%m-%d)
 
# Create full backup filename with date
BACKUP_FILE="$BACKUP_DIR/backup-$DATE.tar.gz"
 
# Create the tar.gz backup file
tar -czf $BACKUP_FILE $SOURCE_DIR
# -c : create archive
# -z : compress using gzip
# -f : specify filename of archive
 
# Print success message
echo "Backup of $SOURCE_DIR completed successfully."
echo "Backup stored as: $BACKUP_FILE"



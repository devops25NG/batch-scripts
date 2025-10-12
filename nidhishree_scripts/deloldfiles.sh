#!/bin/bash

set -x
mkdir -p /home/ec2-user/log_backup1

tar_name="log_backup1_$(date +%d%m%Y).tar.gz"

find logs/ -type f -mtime +30 -exec tar -czf /home/ec2-user/log_backup1/$tar_name {} +

if [ -f /home/ec2-user/log_backup1/$tar_name ]; then
    echo "The archive successfully created at /home/ec2-user/log_backup1/$tar_name"
    find /home/ec2-user/logs/ -type f -mtime +30 -delete
    echo "Old files deleted"
else
    echo "Archive Creation for logs files failed"
fi




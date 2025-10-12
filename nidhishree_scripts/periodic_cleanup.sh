#!/bin/bash

temp_dir="/tmp/temp_prac"

Days=7

Log_file="/home/ec2-user/cleanup_temp.log"

echo "$(date): starting cleanup of $temp_dir" >> $Log_file

find "$temp_dir" -type f -mtime +$Days -exec rm -f {} \; 2>>"$Log_file"
find "$temp_dir" -type d -empty -delete 2>>"$Log_file"

echo "$(date): cleanup completed." >> "$Log_file"



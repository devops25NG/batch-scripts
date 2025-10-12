#!/bin/bash

max=100240
dir="/home/ec2-user/Narendra/importent"
size=$(df $dir | cut -f1)

if [ "$size" -gt $max]
then
	echo "The directory $dir exceded $size take a action" | mail -s "Directory Alart!!" -c "test@example.com" "narendrageddam95@gmail.com"
fi

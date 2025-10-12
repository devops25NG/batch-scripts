#!/bin/bash

users=$(awk -F ":" '{print $1}' /etc/passwd)

for user in $users
do
	exptime=$(chage -l $user | grep "Password expires" | awk -F ":" '{print $2}')
	echo "$user $exptime"
done

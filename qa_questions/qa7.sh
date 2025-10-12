#!/bin/bash

if [ -f "/etc/*release" ]; then
	OS=$(grep "^ID=" /etc/*release | cut -d "=" -f2 | sed 's/"//g')
else
	read -p "Enter OS ID (ex: rhel, centos, amzn, ubuntu, debian): " OS
fi


case $OS in
	rhel|centos|amzn)
		echo "Running update and upgrade..."
		sudo yum update && sudo yum upgrade -y
		;;
	ubuntu|debian)
		echo "running update and upgrade..."
		sudo apt update && sudo apt upgrade -y
		;;
	*)
		echo "OS not detected or enter correct ID"
		;;
esac
	

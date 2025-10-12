#!/bin/bash

cpu_ug=$(mpstat 1 1 | awk '/Average:/ {printf("%.0f", 100 - $NF)}')
mem_ug=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')
dsk_ug=$(df / | awk 'NR==2 {print $5}' | sed 's/%//g')
logfile="/var/log/resources_alert.log"
mailid="narendrageddam95@gmail.com"


for res_typ in CPU RAM Disk
do
	case $res_typ in
		CPU) res=$cpu_ug;;
		RAM) res=$mem_ug;;
		Disk) res=$dsk_ug;;
	esac

	if (($res >= 30))
	then
		echo "$res_typ usage $res% reached above threshold" >> $logfile
		echo "$res_typ usage $res% reached above threshold"
		tail -n 10 $logfile | mail -s "Resource Alert !!" "$mailid"
	else
		echo "$res_typ usage $res% resource in good condition" >> $logfile
		echo "$res_typ usage $res% resource in good condition"
	fi
done

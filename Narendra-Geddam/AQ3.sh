#!/bin/bash

read -p "Enter a number: " n

for ((i=1;i<=n;i++));
do
#	echo "$(seq 1 1 $i)"
	seq -s " " 1 $i
done



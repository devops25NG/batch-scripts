#!/bin/bash
 
echo "Enter a string:"
read str
 
i=${#str}  # get string length
 
while [ $i -gt 0 ]
do
	i=$((i-1))
	echo -n "${str:$i:1}"   # print character without newline
done
echo

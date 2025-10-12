#!/bin/bash

read -p "Enter the string : " str
len=$(echo $str | wc -c)
n=$(($len-1))
rev=""

while [ $n -ge 0 ]
do
	rev="$rev${str:$n:1}"
	((n--))
done
echo "$rev"

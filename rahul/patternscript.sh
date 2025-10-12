#!/bin/bash

read -p "Enter a number: " n

for ((i=1;i<=n;i++));
do
	seq -s " " 1 $i
done


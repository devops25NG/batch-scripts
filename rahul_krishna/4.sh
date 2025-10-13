#!/bin/bash

echo "Enter a number: " 
read n

i=1
while [ $i -le $n ]; do
    sum=1
    line=""
    while [ $sum -le $i ]; do
        line+="$sum"
        sum=$((sum + 1))
    done
    echo "$line"
    i=$((i + 1))
done

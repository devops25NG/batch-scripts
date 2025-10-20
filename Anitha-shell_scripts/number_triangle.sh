#!/bin/bash

echo "Enter number of rows:"
read n
count=1
for i in $(seq $n); do
    echo $(seq -s " " $count $((count+i-1)))
    count=$((count + i))
done


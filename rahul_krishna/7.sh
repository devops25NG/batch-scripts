#!/bin/bash

echo "Enter number of rows:"
read n

num=1
row=1

while [ $row -le $n ]; do
    col=1
    while [ $col -le $row ]; do
        echo -n "$num "
        num=$((num + 1))
        col=$((col + 1))
    done
    echo
     row=$((row + 1))
done

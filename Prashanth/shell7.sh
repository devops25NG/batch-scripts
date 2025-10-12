#!/bin/bash

echo "enter the value"
read n

prev=1

#for ((i=1;i<=n;i++))
for i in $(seq 1 $n)
do
#       for ((j=0;j<=i;j++))
        for j in $(seq 0 $i)
        do
                echo -n "$prev "
                ((prev+=1))
        done
        echo
done


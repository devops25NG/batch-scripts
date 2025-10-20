#!/bin/bash

echo "Enter a number:"
read n

for i in $(seq $n)
do
  echo $(seq -s " " 1 $i)
done


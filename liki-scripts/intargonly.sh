#!/bin/bash

echo " The integer arguments are:"

for i in "$@"
do 
if [[ $i =~ ^[0-9]+$ ]]; then
echo "$i"
fi
done


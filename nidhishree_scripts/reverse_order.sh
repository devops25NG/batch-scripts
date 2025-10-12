#!/bin/bash

if [ $# -ne 1 ]; then
   echo "usage: $0 <filename>"
   exit 1
fi

file=$1

if [ ! -f "$file" ]; then
   echo "the file $file doesnot exists or not found"
   exit 1
fi

lines=$(wc -l < "$file")

for (( i=lines; i>=1; i-- ))
do
   sed -n "${i}p" "$file"
done

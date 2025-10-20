#!/bin/bash
 
echo "Enter the file name:"
read filename
 
if [ ! -f "$filename" ]; then
  echo "File not found!"
  exit 1
fi
 
i=0
while read line
do
  lines[i]="$line"
  ((i++))
done < "$filename"
 
for ((j=i-1; j>=0; j--))
do
  echo "${lines[j]}"
done


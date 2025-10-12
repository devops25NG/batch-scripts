#i!/bin/bash

read -p "Enter file name: " fname

i=0
while read  line
do
    arr[i]="$line"
    ((i++))
done < "$fname"

for ((j=i-1; j>=0; j--))
do
    echo "${arr[j]}"
done

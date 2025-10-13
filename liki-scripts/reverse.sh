#!/bin/bash
# Script to reverse a string using a while loop

read -p "Enter a string: " str

len=${#str}
rev=""

while [ $len -gt 0 ]
do
    # Extract each character from the end
    char=${str:len-1:1}
    rev="$rev$char"
    ((len--))
done

echo "Reversed string: $rev"

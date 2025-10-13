#!/bin/bash

echo "Enter string"
read string

len=${#string}
rev=""

while [ $len -gt 0 ]; do
    char=${string:len-1:1}
    rev="$rev$char"
    len=$((len - 1))
done

echo "Reversed string::   $rev"

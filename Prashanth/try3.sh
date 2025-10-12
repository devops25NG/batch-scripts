#!/bin/bash

echo "Enter the name"
read name

#set -x

count=${#name}
rev=""

while
    [ $count -ge 0 ] ; do
    rev="$rev${name:$count:1}"
    count=$((count - 1))
done

echo "$rev"


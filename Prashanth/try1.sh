#!/bin/bash

#num1=$1
#num2=$2
#set -x

args=("$@")
count=$#
echo "${args[1]}"

for ((i=$((count-1));i>=0;i--))
do
    echo "${args[i]}"
done


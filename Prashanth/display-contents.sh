#!/bin/bash

echo "Enter the file name"
read file

#set -x

if [ -f $file ] ; then
    cat -n $file | sort -rn | cut -f2-
#   echo "$file"
else
    echo "The $file is not available


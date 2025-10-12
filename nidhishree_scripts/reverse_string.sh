#!/bin/bash

read -p "enter a string: " str
rev=""

while [ -n "$str" ]
do
   rev="${rev}${str: -1}"
   str="${str%?}"
done

echo "reversed string: $rev"

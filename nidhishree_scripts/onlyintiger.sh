#!/bin/bash

echo "the intiger arguments are:"

for i in "$@"
do
  if [[ $i =~ ^[0-9]+$ ]]; then
      echo "$i"
  fi
done

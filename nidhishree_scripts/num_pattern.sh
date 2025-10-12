#!/bin/bash

 echo "enter the value of n"
 read -p "enter the number of rows:" n

 for (( i=1; i<=n; i++ ))
 do
    for (( j=1; j<=i; j++ ))
        do
          echo -n "$j"
        done
        echo
done


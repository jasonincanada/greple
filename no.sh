#!/bin/bash
#
# add to the list of letters that it can't have

for letter in "$@"
do
  echo "$letter" >> exclude.txt
done

./go.sh


#!/bin/bash
#
# add to the list of letters that it must have

for letter in "$@"
do
  echo "$letter" >> include.txt
done

./go.sh


#!/bin/bash
#
# construct and run our multi-stage grep command

CMD="cat words "


# inclusions
#
while read letter
do
  CMD="$CMD | grep '$letter' "
done < include.txt


# exclusions
#
if [ -f "exclude.txt" ]; then
  EXCLUDE=$(tr '\n' '|' < exclude.txt | sed 's/|$//')
  CMD="$CMD | grep -v -E '$EXCLUDE'"
fi

eval $CMD > leftover

cat leftover


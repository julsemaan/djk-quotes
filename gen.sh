#!/bin/bash

t=$(mktemp)

for f in *.json; do
  cat $f | jq -r .[] >> $t
done

t2=$(mktemp)
while IFS= read -r line; do
  echo $line >> $t2
  echo % >> $t2
done < $t

t3=$(mktemp)
sed '$ d' $t2 > $t3

strfile -c % $t3 quotes.dat


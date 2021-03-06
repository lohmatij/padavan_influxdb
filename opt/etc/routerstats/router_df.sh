#!/bin/sh

dir=$(dirname "$0")

name="router_df"
columns="used available"

 df | tail -n +2 | awk '{print $6,$3,$4}' | uniq |  while read -r line; do
    points=$( echo "$line" | sed 's/^[^ ]* //g' )
	disk=$( echo "$line" | sed 's/ .*$//g' )
	"$dir"/todb.sh "$name" "$columns" "$points" "disk=$disk"	
done
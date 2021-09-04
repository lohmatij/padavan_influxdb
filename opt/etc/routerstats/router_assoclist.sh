#!/bin/sh

dir=$(dirname "$0")

name="router_clients"
column="mac"
awk -F "," '$6 == "0" { print "\""$2"\"", "ip=\""$1"\",name=\""$3"\"" }' /tmp/static_ip.inf | while read -r line; do
  point=${line%% *}
  tag=${line#* }
  "$dir"/todb.sh "$name" "$column" "$point" "$tag"
done

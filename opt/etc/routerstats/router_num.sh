#!/bin/sh

dir=$(dirname "$0")

name="router_assoclist"
columns="count"
p1=$(cat /tmp/static_ip.num)
points="$p1"
"$dir"/todb.sh "$name" "$columns" "$points"
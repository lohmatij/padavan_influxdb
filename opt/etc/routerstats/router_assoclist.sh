#!/bin/sh

# wl sta_info F8:16:54:8F:F6:6A

dir=$(dirname "$0")

name="router_assoclist"
columns="count"
p1=$(cat /tmp/static_ip.num)
points="$p1"
"$dir"/todb.sh "$name" "$columns" "$points"
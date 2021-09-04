#!/bin/sh

dir=$(dirname "$0")

name="router_mem"
columns="used_kb free_kb buffcache_kb"
#points=`top -bn1 | head -3 | awk '/Mem/ {print $2,$4}' | sed 's/K//g'`
points=$(free | awk '/Mem/ {print $3,$4,$6}' )

"$dir"/todb.sh "$name" "$columns" "$points"

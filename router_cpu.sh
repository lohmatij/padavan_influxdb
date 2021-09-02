#!/bin/sh

dir=$(dirname "$0")

name="router_cpu"
points=$(top -bn1 | head -3 | awk '/CPU/ {print "usr="$2,"sys="$4,"nic="$6,"idle="$8,"io="$10,"irq="$12,"sirq="$14}' | sed 's/%//g')
"$dir"/todb.sh "$name" "$points"

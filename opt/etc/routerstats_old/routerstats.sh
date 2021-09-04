#!/bin/sh

DIR=$(dirname "$0")

nice -n -19 "$DIR"/router_cpu.sh
nice -n -19 "$DIR"/router_mem.sh
nice -n -19 "$DIR"/router_net.sh
nice -n -19 "$DIR"/router_ping_ext.sh
nice -n -19 "$DIR"/router_assoclist.sh

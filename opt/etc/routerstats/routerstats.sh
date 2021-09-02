#!/bin/sh

DIR=$(DIRname "$0")

nice -n -19 "$DIR"/router_cpu.sh
sleep 1
nice -n -19 "$DIR"/router_mem.sh
sleep 1
nice -n -19 "$DIR"/router_net.sh
sleep 1
nice -n -19 "$DIR"/router_ping_ext.sh
sleep 1
nice -n -19 "$DIR"/router_assoclist.sh

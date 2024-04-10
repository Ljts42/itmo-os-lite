#!bin/bash
ps -A o pid,command | grep -E "[ 0-9]{7} /sbin/" | sed -E "s/^ *//" | cut -d " " -f 1 > res2

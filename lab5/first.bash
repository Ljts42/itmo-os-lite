#!/bin/bash
bash mem.bash &
mem1=$!
bash mem2.bash &
mem2=$!
echo "Second step. Pid1=$mem1, pid2=$mem2" >> second.log
while true; do
    top -b -n 1 -o %CPU | sed -n '4,12p' >> second.log
    sleep 0.5s
    if [[ !((-d "/proc/$mem1") || (-d "/proc/$mem2")) ]]; then
        break
    fi
done
dmesg | grep "$mem1 (bash)" | tail -n 2 >> second.log
dmesg | grep "$mem2 (bash)" | tail -n 2 >> second.log
echo "" >> second.log

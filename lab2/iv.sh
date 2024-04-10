#!bin/bash
for pid in $(ps h -A o pid); do
    if [[ !(-f /proc/$pid/status) ]]; then
        continue
    fi
    ppid=$(cat /proc/$pid/status | grep "PPid" | cut -f 2)
    ser=$(cat /proc/$pid/sched | grep "sum_exec_runtime" | cut -d ":" -f 2)
    nrs=$(cat /proc/$pid/sched | grep "nr_switches" | cut -d ":" -f 2)
    art=$(echo "scale=6; $ser / $nrs" | bc)
    if [[ $(echo $art | cut -c 1) == "." ]]; then
        art=0$art
    fi
    echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$art"
done | sort -t = -nk 3 > res4

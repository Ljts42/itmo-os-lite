#!bin/bash
for pid in $(ps h -A o pid); do
    if [[ !(-f /proc/$pid/io) ]]; then
        continue
    fi
    r_b=$(cat /proc/$pid/io | grep "read_bytes" | cut -d " " -f 2)
    echo "$pid\t$r_b"
done > start
sleep 60
for pid in $(ps h -A o pid); do
    if [[ !(-f /proc/$pid/io) ]]; then
        continue
    fi
    r_b_s=$(cat start | grep "$pid\t" | cut -f 2)
    r_b_e=$(cat /proc/$pid/io | grep "read_bytes" | cut -d " " -f 2)
    let sub=rbe-rbs
    echo "$sub:$pid"
done > start
while read i; do
    pid=$(echo "$i" | cut -d ":" -f 2)
    sub=$(echo "$i" | cut -d ":" -f 1)
    cmd=$(cat /proc/$pid/cmdline)
    echo "$pid:$cmd:$sub"
done <<< "$(cat start | sort -n | tail -n 3)"
rm start

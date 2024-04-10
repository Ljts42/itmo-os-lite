#!bin/bash
# 1
max=0
res=0
for pid in $(ps h -A o pid); do
    if [[ !(-d "/proc/$pid") ]]; then
        continue
    fi
    vmd=$(cat "/proc/$pid/statm" | cut -d " " -f 2)
    if (( $vmd > $max )); then
        max=$vmd
        res=$pid
    fi
done
echo "$res"

# 2
top -b -n 1 -o RES | head -n 8 | tail -n 1 | awk '{print $1}'

# 3
ps -A -o pid,rss --sort=rss | tail -n 1 | head -n 1 | awk '{print $1}'


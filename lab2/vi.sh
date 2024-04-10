#!bin/bash
max=0
res=0
for pid in $(ps h -A o pid); do
    if [[ !(-f /proc/$pid/statm) ]]; then
        continue
    fi
    vmd=$(cat /proc/$pid/statm | cut -d " " -f 1)
    if [[ $vmd -gt $max ]]; then
        max=$vmd
        res=$pid
    fi
done
echo "$res"
# top -o %MEM

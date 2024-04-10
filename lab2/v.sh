#!bin/bash
echo -n > res5
for ppid in $(cat res4 | cut -d " " -f 3 | cut -d = -f 2 | uniq); do
    lines=$(cat res4 | grep "Parent_ProcessID=$ppid")
    c=$(echo "$lines" | wc -l)
    s=0
    while read i; do
        echo "$i" >> res5
        art=$(echo "$i" | cut -d "=" -f 4)
        s=$(echo "scale=6; $s+$art" | bc)
    done <<< "$lines"
    arc=$(echo "scale=6; $s / $c" | bc)
    if [[ $(echo "$arc" | cut -c 1) == "." ]]; then
        arc="0$arc"
    fi
    echo "Average_Running_Children_of_ParentID=$ppid is $arc" >> res5
done

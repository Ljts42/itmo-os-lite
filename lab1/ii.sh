#!bin/bash
B=""
while true; do
    read A
    if [[ $A == "q" ]]; then
        break
    fi
    B=$B$A
done
echo $B

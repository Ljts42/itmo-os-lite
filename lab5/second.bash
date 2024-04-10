#!/bin/bash
# second.bash N K
if (( $# != 2 )); then
    echo "Must be 2 parameters"
    exit 1
fi

for ((i=1; i <= $2; i++)); do
    bash newmem.bash $1 &
    echo $!
done

#!/bin/bash
group=$(cat example.data | grep -Eo "M[34][1-4][34][0-9][12]?" | sort | uniq -c | sort -n -t \t -k 1 | tail -n 1 | rev | cut -d " " -f 1 | rev)
echo $group
echo "$(cat example.data | grep $group | cut -d ' ' -f 1,2)"

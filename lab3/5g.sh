#!bin/bash
# 5g.sh
echo $$ > .pid5
while true; do
    read LINE
    echo "$LINE" > pipe5
done

#!bin/bash
# 5h.sh
m=false
r=1
(tail -f pipe5) |
while true; do
    read LINE
    case $LINE in
        QUIT)
            echo 'exit'
            killall tail
            kill $(cat .pid5)
            exit 0;;
        +)
            m=false;;
        \*)
            m=true;;
        [0-9-]*)
            if $m; then
                let r=$r\*$LINE
            else
                let r=$r+$LINE
            fi
            echo $r;;
        *)
            echo "wrong input"
            killall tail
            kill $(cat .pid5)
            exit 1;;
    esac
done

#!/bin/bash
echo $$ > .pid
res=3
wins=0

output() {
    case $res in
        0)
            let wins=$wins+1
            echo "You won! Current number of wins: $wins"
            ;;
        1) echo "Draw.";;
        2) echo "Lose"; exit;;
    esac
    res=3
}
usr1() {
    if (( res == 3 )); then
        res=0
    else
        output
    fi
}
usr2() {
    if (( res == 3 )); then
        res=2
    else
        let res=$res+1
        output
    fi
}
trap 'usr1' USR1
trap 'usr2' USR2
while true; do
    :
done

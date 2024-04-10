#!/bin/bash
win() {
    kill -USR1 $(cat .pid)
    kill -USR1 $(cat .pid)
}
draw() {
    kill -USR1 $(cat .pid)
    kill -USR2 $(cat .pid)
}
lose() {
    kill -USR2 $(cat .pid)
    kill -USR1 $(cat .pid)
}
while true; do
    read LINE
    let rand=$RANDOM%3
    case $LINE in
        0) case $rand in
            0) draw;;
            1) win;;
            2) lose;;
           esac;;
        1) case $rand in
            0) lose;;
            1) draw;;
            2) win;;
           esac;;
        2) case $rand in
            0) win;;
            1) lose;;
            2) draw;;
           esac;;
        QUIT) kill -SIGTERM $(cat .pid); exit;;
        *) : ;;
    esac
done

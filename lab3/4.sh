#!bin/bash
for i in 1 2 3; do
    bash -c 'while true; do x=12*34; done' &
    eval "pid$i=$!"
done

cpulimit -l 10 -p $pid1 &
kill $pid3

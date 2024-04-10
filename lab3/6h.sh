#!bin/bash
echo $$ > .pid
r=1
MODE="+"

usr1() {
    MODE="+"
}
usr2() {
    MODE="*"
}
term() {
    MODE="stop"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM

while true; do
    case $MODE in
        "+")
            let r=$r+2
            echo $r;;
        "*")
            let r=$r\*2
            echo $r;;
        "stop")
            echo "Stopped by SIGTERM"
            exit;;
    esac
    sleep 1
done

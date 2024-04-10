#!bin/bash
echo -e "Menu:\n1) nano\n2) vi\n3) links\n4) quit"
while true; do
    read input
    case $input in
        1 ) nano;;
        2 ) vi;;
        3 ) links;;
        4 ) exit;;
    esac
done

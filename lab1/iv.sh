#!bin/bash
if [[ $PWD == $HOME ]]; then
    echo $HOME
    exit 0
else
    echo "Wrong directory"
    exit 1
fi

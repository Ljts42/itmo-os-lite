#!bin/bash
sort -t : -nk 3 /etc/passwd | cut -d : -f 1,3

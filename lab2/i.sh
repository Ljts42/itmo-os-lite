#!bin/bash
a=$(ps h -u user o pid,cmd)
echo "$a" | wc -l > res1
echo "$a" >> res1

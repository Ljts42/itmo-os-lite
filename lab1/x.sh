#!bin/bash
man bash | grep -iow "[a-z]\{4,\}" | sort | uniq -c | sort -nk 1 | tail -n3

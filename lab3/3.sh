#!bin/bash
echo "5 * * * $(date +'%u') 1.sh" | crontab

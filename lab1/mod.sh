#!bin/bash
touch tmp
while read line; do
    echo "$line" | sed -E "s/bicth/*****/" | sed -E "s/fuck/****/" | sed -E "s/shit/****/" >> tmp
done < "$1"
mv tmp "$1"
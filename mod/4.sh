#!bin/bash
path=$(ls "$HOME" | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -n -t - -k 2,4 | tail -n 1)
report="$HOME/backup-report"
if (( $(date -d $(echo "$path" | cut -d - -f 2-) +%s) + 691199 >= $(date +%s) )); then
    path="$HOME/$path"
    new=""
    old=""
    for filename in $(ls -A "$HOME/source"); do
        if [[ !(-e "$path/$filename") ]]; then
            echo ":$filename:new"
            cp "$HOME/source/$filename" "$path"
            new="$new$filename\n"
        elif [[ $(stat "$HOME/source/$filename" -c %s) -ne $(stat "$path/$filename" -c %s) ]]; then
            echo ":$filename:edit"
            mv "$path/$filename" "$path/$filename.$(date -I)"
            cp "$HOME/source/$filename" "$path"
            old="$old$filename $filename.$(date -I)\n"
        # modification
        elif !(cmp -s "$HOME/source/$filename" "$path/$filename"); then
            echo ":$filename:edit"
            mv "$path/$filename" "$path/$filename.$(date -I)"
            cp "$HOME/source/$filename" "$path"
            old="$old$filename $filename.$(date -I)\n"
        fi
        #
    done
    if [[ -n "$new" || -n "$old" ]]; then
        echo "[$(date -I)] Updated $path:" >> "$report"
        if [[ -n "$new" ]]; then
            echo -n -e "New files:\n$new" >> "$report"
        fi
        if [[ -n "$old" ]]; then
            echo -n -e "Changed files:\n$old" >> "$report"
        fi
    else
        echo "[$(date -I)] Everything is up to date." >> "$report"
    fi
else
    path="$HOME/Backup-$(date -I)"
    mkdir "$path"
    cp -R "$HOME/source/." "$path"
    echo -e "[$(date -I)] Created $path. Copied files:\n$(ls -A $HOME/source)" >> "$report"
fi

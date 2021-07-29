#!/bin/bash
MUTED=0
xprop -spy |
        while IFS= read -r line
        do
                SONG=$(echo $line | grep -oP "WM_NAME\(STRING\).*" | sed 's/WM_NAME(STRING) = //g' | sed 's/"//g')
                if [[ $SONG == "Advertisement" ]]; then
                        amixer -q -D pulse sset Master mute
                        MUTED=1
                else
                        if [[ $MUTED -eq 1 ]]; then
                                if [[ $SONG != "" ]]; then
                                        amixer -q -D pulse sset Master unmute
                                        MUTED=0
                                fi
                        fi
                fi
        done

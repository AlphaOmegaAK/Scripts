#!/usr/bin/env bash

CODEDIR="$HOME/Code"
FOLDERS=("Java" "Javascript" "Typescript" "Scripts" "Rust" "Python")


for file in ${FOLDERS[@]}; do
    if [[ -d "$CODEDIR"/"$file" ]]; then
        echo "File exists"
    else
        echo "File does not exits"
        echo "Making $file in $CODEDIR"
        mkdir -p "$CODEDIR"/"$file"
    fi
done

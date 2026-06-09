#!/bin/bash

# Ensure the input file exists before running
input_file="new9.csv"

if [ ! -f "$input_file" ]; then
    echo "Error: $input_file not found."
    exit 1
fi

# Read the file line by line, splitting by semicolon
while IFS=';' read -r col1 col2 || [ -n "$col1" ]; do
    # Skip empty lines
    [ -z "$col1" ] && continue

    echo "$col1 $col2"
    
    # Run yt-dlp (assumes yt-dlp is installed and in your PATH)
    ./yt-dlp_linux --download-archive youtube-dl.list \
           --ignore-errors \
           --add-metadata \
           --write-sub \
           --sub-lang en,ta \
           --write-thumbnail \
           --embed-subs \
           -f "(299/137)+(258/256/140)/bestvideo[height<=?1080]+(258/256/140)/bestvideo[ext=webm]+251/bestvideo[ext=webm]+(250/249)/best" \
           "$col2"

done < "$input_file"

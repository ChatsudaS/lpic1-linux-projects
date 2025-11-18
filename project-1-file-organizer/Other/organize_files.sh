#!/bin/bash

TARGET_DIR="${1:-$PWD}"

for file in "$TARGET_DIR"/*; do
  [ -f "$file" ] || continue
  case "${file##*.}" in
    jpg|jpeg|png|gif|bmp) FOLDER="Images";;
    mp4|mkv|mov|avi) FOLDER="Videos";;
    mp3|wav|aac|ogg) FOLDER="Audio";;
    pdf|doc|docx|txt) FOLDER="Documents";;
    zip|tar|gz|bz2|rar) FOLDER="Archives";;
    *) FOLDER="Other";;
  esac
  mkdir -p "$TARGET_DIR/$FOLDER"
  mv "$file" "$TARGET_DIR/$FOLDER/"
done

echo "Files organized by type into folders."


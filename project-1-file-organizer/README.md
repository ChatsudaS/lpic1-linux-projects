# Project 1: File Organization Script

A bash script that automatically sorts files into subfolders based on their file type.

## What It Does

Scans a target folder and moves each file into the correct subfolder:
- **Images** — jpg, jpeg, png, gif, bmp
- **Videos** — mp4, mkv, mov, avi
- **Audio** — mp3, wav, aac, ogg
- **Documents** — pdf, doc, docx, txt
- **Archives** — zip, tar, gz, bz2, rar
- **Other** — anything that doesn't match above

## How to Use

```bash
# Sort files in current folder
./organize_files.sh

# Sort files in a specific folder
./organize_files.sh /home/ubuntu/downloads
```

## What I Learned
- Bash loops (for loop)
- Case statements for pattern matching
- File extension detection
- Automating repetitive file management tasks



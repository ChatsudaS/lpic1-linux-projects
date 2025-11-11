#!/bin/bash
# Automated Backup Script

SOURCE_DIR="$HOME/important-files"
BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .

echo "Backup completed successfully!"
echo "Backup file created at: $BACKUP_FILE"
echo ""
echo "Recent backups in $BACKUP_DIR:"
ls -lh "$BACKUP_DIR" | tail -5


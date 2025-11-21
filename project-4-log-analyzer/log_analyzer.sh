#!/bin/bash

LOG_FILE="${1:-/var/log/syslog}"

if [ ! -f "$LOG_FILE" ]; then
  echo "Log file not found: $LOG_FILE"
  exit 1
fi

echo "===== LOG FILE ANALYZER ====="
echo "Analyzing: $LOG_FILE"
echo ""

echo "===== Top 10 Log Sources ====="
awk '{print $5}' "$LOG_FILE" 2>/dev/null | sort | uniq -c | sort -nr | head -10

echo ""
echo "===== Top 10 Error Keywords ====="
grep -i "error" "$LOG_FILE" 2>/dev/null | awk '{print $5}' | sort | uniq -c | sort -nr | head -10

echo ""
echo "===== Log File Stats ====="
echo "Total lines: $(wc -l < "$LOG_FILE")"
echo "Date range:"
echo "  First: $(head -1 "$LOG_FILE" | awk '{print $1,$2,$3}')"
echo "  Last: $(tail -1 "$LOG_FILE" | awk '{print $1,$2,$3}')"

echo ""
echo "===== Analysis Complete ====="


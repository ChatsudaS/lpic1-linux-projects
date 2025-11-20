#!/bin/bash

REPORT_FILE="system_report_$(date +%Y%m%d_%H%M%S).txt"

{
  echo "=========================================="
  echo "SYSTEM INFORMATION REPORT"
  echo "Generated: $(date)"
  echo "=========================================="
  echo ""
  
  echo "--- HOSTNAME & UPTIME ---"
  echo "Hostname: $(hostname)"
  echo "Uptime: $(uptime)"
  echo ""
  
  echo "--- OS INFORMATION ---"
  echo "OS: $(uname -s)"
  echo "Kernel: $(uname -r)"
  echo "Architecture: $(uname -m)"
  echo ""
  
  echo "--- CPU INFORMATION ---"
  echo "CPU Cores: $(sysctl -n hw.ncpu 2>/dev/null || nproc)"
  echo "CPU Model: $(sysctl -n machdep.cpu.brand_string 2>/dev/null || grep 'model name' /proc/cpuinfo | head -1)"
  echo ""
  
  echo "--- MEMORY INFORMATION ---"
  vm_stat | grep "Pages free:" | awk '{print "Free Memory: " $3 " pages"}'
  vm_stat | grep "Pages active:" | awk '{print "Active Memory: " $3 " pages"}'
  echo "Total Memory: $(sysctl -n hw.memsize 2>/dev/null | awk '{print $1/1024/1024/1024 " GB"}' || grep MemTotal /proc/meminfo)"
  echo ""
  
  echo "--- DISK USAGE ---"
  df -h | head -n 6
  echo ""
  
  echo "--- TOP 5 RUNNING PROCESSES ---"
  ps aux --sort=-%cpu | head -6
  echo ""
  
  echo "--- NETWORK INTERFACES ---"
  ifconfig | grep "inet " | awk '{print $2}' || ip addr show | grep "inet " | awk '{print $2}'
  echo ""
  
  echo "=========================================="
  echo "Report End"
  echo "=========================================="

} > "$REPORT_FILE"

echo "System report saved to: $REPORT_FILE"
cat "$REPORT_FILE"


#!/bin/bash
# Check disk usage and log it

REPORT_DIR="$HOME/DevOps-Mastery-Specialization"
REPORT_FILE="$REPORT_DIR/disk_report.txt"

# Create directory if not exists
mkdir -p "$REPORT_DIR"

# Append timestamp and disk usage together
{
  echo "------------------------------------"
  echo "Disk usage logged at $(date)"
  df -h
} >> "$REPORT_FILE"

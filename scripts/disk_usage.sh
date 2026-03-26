#!/bin/bash
# Check disk usage and log it
df -h > ~/DevOps/disk_report.txt
echo "Disk usage logged at $(date)" >> ~/DevOps/disk_report.txt


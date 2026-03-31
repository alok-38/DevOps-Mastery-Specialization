#!/bin/bash
# Minimal Fedora 43 service hardening script
# Disables non-essential services safely

echo "Starting Fedora 43 optional service cleanup..."

# List of non-essential services to disable
SERVICES=(
    "pcscd.service"
    "pcscd.socket"
    "bolt.service"
    "cups.service"
    "cups.socket"
    "colord.service"
    "atd.service"
    "mcelog.service"
    "low-memory-monitor.service"
    "irqbalance.service"
    "bluetooth.service"
    "ModemManager.service"
    "avahi-daemon.service"
)

# Loop through and disable each service
for svc in "${SERVICES[@]}"; do
    if systemctl list-unit-files | grep -q "$svc"; then
        echo "Disabling $svc..."
        sudo systemctl disable --now "$svc"
    else
        echo "$svc not found, skipping."
    fi
done

echo "Optional services disabled. Listing remaining active services..."
sudo systemctl list-units --type=service --state=running
echo "Done!"

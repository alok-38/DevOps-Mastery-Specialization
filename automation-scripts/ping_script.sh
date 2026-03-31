#!/usr/bin/bash

for vm in $(sudo virsh list --name); do
  ip=$(sudo virsh domifaddr "$vm" 2>/dev/null | awk '/ipv4/ {print $4}' | cut -d/ -f1)

  if [ -n "$ip" ]; then
    if ping -c 1 -W 1 "$ip" >/dev/null; then
      echo "$vm ($ip) is reachable"
    else
      echo "$vm ($ip) is NOT reachable"
    fi
  else
    echo "$vm has no IP"
  fi
done

for vm in almalinux10 debian13 opensuse16.0; do
  if ! sudo virsh domstate "$vm" | grep -q running; then
    sudo virsh start "$vm" &
  fi
done
wait

for vm in almalinux10 debian13 opensuse16.0; do
  state=$(sudo virsh domstate "$vm")

  if [[ "$state" == "running" ]]; then
    echo "Shutting down $vm..."
    sudo virsh shutdown "$vm" &
  else
    echo "$vm is not running (state: $state)"
  fi
done

wait
echo "All shutdown commands issued."

sudo virsh list --all

for vm in $(sudo virsh list --all --name); do
  state=$(sudo virsh domstate "$vm")
  ip=$(sudo virsh domifaddr "$vm" 2>/dev/null | awk '/ipv4/ {print $4}')
  ip=${ip:-"-"}
  printf "%-15s %-10s %s\n" "$vm" "$state" "$ip"
done

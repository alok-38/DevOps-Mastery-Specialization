for ip in 192.168.122.88 192.168.122.108 192.168.122.207; do
  ssh alok@$ip "sudo useradd -m -s /bin/bash alok"
done

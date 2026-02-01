#!/bin/sh

# literally only bought this vps for this project so i don't give a shit that this
# has been commited
jump="obamna@107.152.38.169"

#install deps
pacman -Sy --noconfirm openssh >/dev/null 2>&1
systemctl enable --now sshd >/dev/null 2>&1


#ssh key (burner)
tmpkey=$(mktemp)
cat >"$tmpkey" <<'EOF'
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACCoTX/jqGR5oZkpO4g/5OAb+uztThfsiilf1F/ZnoqnFAAAAIhXBdljVwXZ
YwAAAAtzc2gtZWQyNTUxOQAAACCoTX/jqGR5oZkpO4g/5OAb+uztThfsiilf1F/ZnoqnFA
AAAEDiuGBQCeDPZad4K4CBI5SYj1tPsdqnfa59ssDSJ2SJA6hNf+OoZHmhmSk7iD/k4Bv6
7O1OF+yKKV/UX9meiqcUAAAABWJ5dGVz
-----END OPENSSH PRIVATE KEY-----
EOF
chmod 600 "$tmpkey"

# immediatly setup firewall rules on jump
VM_IP="$(curl -fsSL https://ifconfig.me)"
ssh -o LogLevel=ERROR -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i "$tmpkey" $jump \
  "sudo ufw allow from $VM_IP to any port 22 proto tcp comment 'vm allow ssh' && \
  sudo ufw delete allow 22 || true; \
  sudo ufw reload" >/dev/null 2>&1

ssh -N -f -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ExitOnForwardFailure=yes -i "$tmpkey" -R 2024:localhost:22 "$jump" >/dev/null 2>&1

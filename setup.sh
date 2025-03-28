#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Set full hostname with domain
echo "ci.kerio.local" > /etc/hostname
hostname ci.kerio.local
echo "127.0.0.1 ci.kerio.local ci" >> /etc/hosts

# Optional: Force a search domain (may help inside some CI setups)
echo "search kerio.local" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# --- Set timezone silently ---
ln -fs /usr/share/zoneinfo/UTC /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# --- Install dependencies ---
apt-get update
apt-get install -y iproute2 openssl libuuid1 procps cifs-utils smbclient curl tzdata

# --- Install Kerio VPN client ---
curl https://cdn.kerio.com/dwn/control/control-9.4.3-8353/kerio-control-vpnclient-9.4.3-8353-linux-amd64.deb --output /tmp/kerio.deb
cp ./install.sh /tmp/install.sh
bash /tmp/install.sh

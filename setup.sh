#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Set fake domain name to satisfy Kerio installer
echo "kerio-ci.local" > /etc/hostname
hostname kerio-ci.local
echo "127.0.0.1 kerio-ci.local" >> /etc/hosts

# Optional: timezone
ln -fs /usr/share/zoneinfo/UTC /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Install dependencies
apt-get update
apt-get install -y iproute2 openssl libuuid1 procps cifs-utils smbclient curl tzdata

# Download and install VPN client
curl https://cdn.kerio.com/dwn/control/control-9.4.3-8353/kerio-control-vpnclient-9.4.3-8353-linux-amd64.deb --output /tmp/kerio.deb
cp ./install.sh /tmp/install.sh
bash /tmp/install.sh

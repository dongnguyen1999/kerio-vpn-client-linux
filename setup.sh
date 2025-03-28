#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# --- Set a fake hostname + domain to make Kerio happy ---
echo "kerio-ci.local" > /etc/hostname
hostname kerio-ci.local
echo "127.0.0.1 kerio-ci.local localhost" >> /etc/hosts
echo "search local" > /etc/resolv.conf

# Set default timezone to UTC (or change to Asia/Ho_Chi_Minh if preferred)
ln -fs /usr/share/zoneinfo/UTC /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

apt-get update
apt-get install -y iproute2 openssl libuuid1 procps cifs-utils smbclient curl tzdata

hostnamectl set-hostname kerio-ci.local
curl https://cdn.kerio.com/dwn/control/control-9.4.3-8353/kerio-control-vpnclient-9.4.3-8353-linux-amd64.deb --output /tmp/kerio.deb
cp ./install.sh /tmp/install.sh
bash /tmp/install.sh

#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Set default timezone to UTC (or change to Asia/Ho_Chi_Minh if preferred)
ln -fs /usr/share/zoneinfo/UTC /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

apt-get update
apt-get install -y iproute2 openssl libuuid1 procps cifs-utils smbclient curl tzdata

curl https://cdn.kerio.com/dwn/control/control-9.4.3-8353/kerio-control-vpnclient-9.4.3-8353-linux-amd64.deb --output /tmp/kerio.deb
cp ./install.sh /tmp/install.sh
bash /tmp/install.sh

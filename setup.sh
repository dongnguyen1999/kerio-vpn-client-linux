#!/bin/bash

apt-get install -y iproute2 openssl libuuid1 procps cifs-utils smbclient curl
curl https://cdn.kerio.com/dwn/control/control-9.4.3-8353/kerio-control-vpnclient-9.4.3-8353-linux-amd64.deb --output /tmp/kerio.deb
cp ./install.sh /tmp/install.sh
bash /tmp/install.sh

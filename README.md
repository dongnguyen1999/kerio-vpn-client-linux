## Setup and connect

### Clone source
```
git clone https://github.com/dongnguyen1999/kerio-vpn-client-linux.git
cd kerio-vpn-client-linux
```

### Obtain the fingerprint

```bash
openssl s_client -connect YOUR_SERVER:YOUR_PORT < /dev/null 2>/dev/null | openssl x509 -fingerprint -md5 -noout -in /dev/stdin
```
- YOUR_SERVER: 112.21x.xx.xx
- YOUR_PORT: 4090

==> Output:
md5 Fingerprint=<YOUR_FINGERPRINT>

### Edit config file *kerio-kvc.conf*

```
<config>
  <connections>
    <connection type="persistent">
      <server>YOUR_SERVER</server>
      <port>YOUR_PORT</port>
      <username>YOUR_USERNAME</username>
      <password>YOUR_PASSWORD</password>
      <fingerprint>YOUR_FINGERPRINT</fingerprint>
      <active>1</active>
    </connection>
  </connections>
</config>
```

### Run setup
```
sudo ./setup.sh
```

### Copy config file
```
sudo cp kerio-kvc.conf /etc/kerio-kvc.conf
```

### Connect VPN
```
sudo ./connect.sh
```

### Test connection
```
ping 192.168.1.125
```
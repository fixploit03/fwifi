#!/bin/bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] This script must be run as root."
  exit 1
fi

# Check internet connection
if ! ping -c 1 google.com &> /dev/null; then
    echo "[Error] No internet connection. Please connect to the internet to install fwifi."
    exit 1
fi

# Update and install dependencies
apt-get update -y
apt-get upgrade -y
apt-get full-upgrade -y
apt-get install wget gzip bc libgmp-dev libbz2-dev yasm build-essential libelf-dev linux-headers-$(uname -r) autoconf automake libtool pkg-config libnl-3-dev libnl-genl-3-dev libssl-dev ethtool shtool rfkill zlib1g-dev libpcap-dev libsqlite3-dev libpcre2-dev libhwloc-dev libcmocka-dev hostapd wpasupplicant tcpdump screen iw usbutils expect cowpatty -y

# Install WiFi driver tplink-tlwn722n
# Uncomment the following lines if needed
# git clone https://github.com/KanuX-14/rtl8188eus.git
# cd rtl8188eus
# echo 'blacklist r8188eu' | sudo tee -a '/etc/modprobe.d/realtek.conf'
# echo 'blacklist rtl8xxxu' | sudo tee -a '/etc/modprobe.d/realtek.conf'
# make
# make install
# modprobe 8188eu
# cd ..

# Configure NetworkManager
# Uncomment the following line if needed
# cat NetworkManager.conf > /etc/NetworkManager/NetworkManager.conf

# Create wordlists directory and download wordlists
mkdir wordlists
cd wordlists
wget https://raw.githubusercontent.com/derv82/wifite2/master/wordlist-top4800-probable.txt
wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz
gzip -d rockyou.txt.gz
wget https://raw.githubusercontent.com/FII14/WOTABUHUN/main/wotabuhun.txt
wget https://raw.githubusercontent.com/mychaelgo/indonesia-wordlist/master/indonesian-wordlist.lst
wget https://github.com/david-palma/wordlists/raw/main/passwords-WPA/wpa-over200k.txt
cd ..

# Clone and install aircrack-ng
git clone https://github.com/aircrack-ng/aircrack-ng
cd aircrack-ng
autoreconf -i
./configure --with-experimental
make
make install
ldconfig
cd ..

# Clone and install john the ripper
git clone https://github.com/openwall/john.git
cd john/src
./configure && make -s clean && make -sj4
cd ../..

# Set execute permission for fwifi and copy to /usr/bin/
chmod +x fwifi
cp fwifi /usr/bin/

echo "[ OK ] fwifi successfully installed."
exit 0

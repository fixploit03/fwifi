#!/bin/bash

g="\e[1;32m"
r="\e[0m"
c="\e[1;36m"

if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] This script must be run as root."
  exit 1
fi

apt-get update -y
apt-get upgrade -y
apt-get full-upgrade -y
apt-get install wget -y
apt-get install gzip -y
apt-get install bc -y
apt-get install build-essential -y
apt-get install libelf-dev -y
apt-get install linux-headers-$(uname -r) -y
apt-get install autoconf -y
apt-get install automake -y
apt-get install libtool -y
apt-get install pkg-config -y
apt-get install libnl-3-dev -y
apt-get install libnl-genl-3-dev -y
apt-get install libssl-dev -y
apt-get install ethtool -y
apt-get install shtool -y
apt-get install rfkill -y 
apt-get install zlib1g-dev -y
apt-get install libpcap-dev -y
apt-get install libsqlite3-dev -y
apt-get install libpcre2-dev -y
apt-get install libhwloc-dev -y
apt-get install libcmocka-dev -y
apt-get install hostapd -y
apt-get install wpasupplicant -y
apt-get install tcpdump -y
apt-get install screen -y
apt-get install iw -y
apt-get install usbutils -y
apt-get install expect -y
git clone https://github.com/KanuX-14/rtl8188eus.git
cd rtl8188eus
echo 'blacklist r8188eu' | sudo tee -a '/etc/modprobe.d/realtek.conf'
echo 'blacklist rtl8xxxu' | sudo tee -a '/etc/modprobe.d/realtek.conf'
make
make install
modprobe 8188eu
cd ..
cat NetworkManager.conf > /etc/NetworkManager/NetworkManager.conf
mkdir wordlists
cd wordlists
wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz
gzip -d rockyou.txt.gz
cd ..
git clone https://github.com/aircrack-ng/aircrack-ng
cd aircrack-ng
autoreconf -i
./configure --with-experimental
make
make install
ldconfig
echo -e "${r}[ ${g}OK ${r}] fwifi successfully installed."

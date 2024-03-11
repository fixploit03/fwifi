#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] This script must be run as root."
  exit 1
fi

if ! ping -c 1 google.com &> /dev/null; then
    echo "[Error] No internet connection. Please connect to the internet to install fwifi."
    exit 1
fi

apt-get update -y
apt-get upgrade -y
apt-get full-upgrade -y
apt-get install wget -y
apt-get install gzip -y
apt-get install bc -y
apt-get install libgmp-dev -y
apt-get install libbz2-dev -y
apt-get install yasm -y
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
# Top 4800 Probable.txt
wget https://raw.githubusercontent.com/derv82/wifite2/master/wordlist-top4800-probable.txt
# RockYou.txt
wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz
gzip -d rockyou.txt.gz
# Wotabuhun.txt
wget https://raw.githubusercontent.com/FII14/WOTABUHUN/main/wotabuhun.txt
# Indonesian Wordlist
wget https://raw.githubusercontent.com/mychaelgo/indonesia-wordlist/master/indonesian-wordlist.lst
cd ..
git clone https://github.com/aircrack-ng/aircrack-ng
cd aircrack-ng
autoreconf -i
./configure --with-experimental
make
make install
ldconfig
cd ..
chmod +x fwifi
cp fwifi /usr/bin/
git clone https://github.com/openwall/john.git
cd john/src
./configure && make -s clean && make -sj4
echo 'export PATH=$PATH:/usr/share/fwifi/john/run' >> ~/.bashrc
echo 'alias john="/usr/share/fwifi/john/run/john"' >> ~/.bashrc
source ~/.bashrc
echo "[ OK ] fwifi successfully installed."
exit 0

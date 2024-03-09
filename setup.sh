#!/bin/bash

g="\e[1;32m"
r="\e[0m"
c="\e[1;36m"

if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] This script must be run as root."
  exit 1
fi

echo -e "${r}[ ${c}info ${r}] Updating repository..."
apt-get update -y
echo -e "${r}[ ${g}OK ${r}] Repository successfully updated."
echo -e "${r}[ ${c}info ${r}] Upgrading repository..."
apt-get upgrade -y
echo -e "${r}[ ${g}OK ${r}] Repository successfully upgraded."
echo -e "${r}[ ${c}info ${r}] installing bc..."
apt-get install bc -y
echo -e "${r}[ ${g}OK ${r}] bc successfully installed."
echo -e "${r}[ ${c}info ${r}] installing build-essential..."
apt-get install build-essential -y
echo -e "${r}[ ${g}OK ${r}] build-essential successfully installed."
echo -e "${r}[ ${c}info ${r}] installing libelf-dev..."
apt-get install libelf-dev -y
echo -e "${r}[ ${g}OK ${r}] libelf-dev successfully installed."
echo -e "${r}[ ${c}info ${r}] installing linux-headers..."
apt-get install linux-headers-$(uname -r) -y
echo -e "${r}[ ${g}OK ${r}] linux-headers successfully installed."
echo -e "${r}[ ${c}info ${r}] cloning rtl8188eus repository..."
git clone https://github.com/KanuX-14/rtl8188eus.git
cd rtl8188eus
echo 'blacklist r8188eu' | sudo tee -a '/etc/modprobe.d/realtek.conf'
echo 'blacklist rtl8xxxu' | sudo tee -a '/etc/modprobe.d/realtek.conf'
make
make install
modprobe 8188eu
cd ..
cat NetworkManager.conf > /etc/NetworkManager/NetworkManager.conf

echo -e "${r}[ ${g}OK ${r}] fwifi successfully installed."

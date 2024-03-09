#!/bin/bash

g="\e[1;32m"
r= "\e[0m"
c="\e[1;36m"

if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] This script must be run as root."
  exit 1
fi

sleep 1
echo -e "${r}[ ${c}info ${r}] Updating repository..."
sleep 1
apt-get update -y
sleep 1
echo -e "${r}[ ${g}OK ${r}] Repository successfully updated."
sleep 1
echo -e "${r}[ ${c}info ${r}] Upgrading repository..."
sleep 1
apt-get upgrade -y
sleep 1
echo -e "${r}[ ${g}OK ${r}] Repository successfully upgraded."
sleep 1
echo -e "${r}[ ${c}info ${r}] install git..."
sleep 1
apt-get install git -y
sleep 1
echo -e "${r}[ ${g}OK ]${r} git successfully installed."
sleep 1
echo -e "${r}[ ${c}info ${r}] Cloning fwifi repository..."
sleep 1
git clone https://github.com/rofidoang03/fwifi.git
cd fwifi

# Install aircrack-ng
cd aircrack-ng
chmod +x install.sh
./install.sh
cd ..

# Install wordlists
cd wordlists
chmod +x install.sh
./install.sh
cd ..

# Install rtl8188eus
cd rtl8188eus
chmod +x install.sh
./install.sh
cd ..

# Set permissions for fwifi
chmod +x fwifi

# Copy fwifi to /usr/bin
cp fwifi /usr/bin

echo -e "${r}[ ${g}OK ${r}] fwifi successfully installed."

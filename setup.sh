#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] Skrip ini harus dijalankan sebagai root."
  exit 1
fi

apt-get update -y
apt-get upgrade -y
apt-get install git -y
git clone https://github.com/rofidoang03/wifi-hacking/
cd aircrack-ng
chmod +x instal.sh
./instal.sh
cd ..
cd wordlists
chmod +x instal.sh
./instal.sh
cd ..
cd rtl8188eus
chmod +x instal.sh
./instal.sh
echo "[+] Selesai."

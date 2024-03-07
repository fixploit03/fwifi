#!/bin/bash
# Program: Instal Driver Wifi TP-Link TLWN722N
# Pembuat: Rofi
# GitHub: https://github.com/rofidoang03/wifi-hacking

instal_driver() {
    apt-get update -y
    apt-get upgrade -y
    apt-get full-upgrade -y
    apt-get install bc -y
    apt-get install build-essential -y
    apt-get install libelf-dev -y
    apt-get install linux-headers-$(uname -r) -y
    git clone https://github.com/KanuX-14/rtl8188eus.git
    cd rtl8188eus
    echo 'blacklist r8188eu' | sudo tee -a '/etc/modprobe.d/realtek.conf'
    echo 'blacklist rtl8xxxu' | sudo tee -a '/etc/modprobe.d/realtek.conf'
    make
    make install
    modprobe 8188eu
    cat NetworkManager.conf > /etc/NetworkManager/NetworkManager.conf
    exit 0
}

while true; do
    read -p "Apakah Anda ingin menginstal Driver WI-FI TP-Link TLWN722N [iya/tidak]: " nanya

    if [[ "${nanya}" == "iya" ]]; then
        instal_driver
    elif [[ "${nanya}" == "tidak" ]]; then
        exit 1
    else
        echo "Masukkan salah!"
        continue
    fi
done

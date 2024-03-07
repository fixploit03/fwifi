#!/bin/bash
# Program: Instal Tools Aircrack-ng
# Pembuat: Rofi
# GitHub: https://github.com/rofidoang03/wifi-hacking

instal_tools() {
    apt-get update -y
    apt-get upgrade -y
    apt-get full-upgrade -y
    apt-get install build-essential -y
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
    git clone https://github.com/aircrack-ng/aircrack-ng
    cd aircrack-ng
    autoreconf -i
    ./configure --with-experimental
    make
    make install
    ldconfig
    exit 0
}

while true; do
    read -p "Apakah Anda ingin menginstal Tools Aircrack-ng [iya/tidak]: " nanya

    if [[ "${nanya}" == "iya" ]]; then
        instal_tools
    elif [[ "${nanya}" == "tidak" ]]; then
        exit 1
    else
        echo "Masukkan salah!"
        continue
    fi
done

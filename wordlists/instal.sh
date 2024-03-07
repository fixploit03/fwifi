#!/bin/bash
# Program: Instal Wordlist (rockyou.txt)
# Pembuat: Rofi
# GitHub: https://github.com/rofidoang03/wifi-hacking

instal_wordlist() {
    apt-get update -y
    apt-get upgrade -y
    apt-get full-upgrade -y
    apt-get install wget -y
    apt-get install gzip -y
    wget https://gitlab.com/kalilinux/packages/wordlists/-/raw/kali/master/rockyou.txt.gz?ref_type=heads
    gzip -d rockyou.txt.gz
    exit 0
}

while true; do
    read -p "Apakah Anda ingin menginstal wordlist rockyou.txt [iya/tidak]: " nanya

    if [[ "${nanya}" == "iya" ]]; then
        instal_wordlist
    elif [[ "${nanya}" == "tidak" ]]; then
        exit 1
    else
        echo "Masukkan salah!"
        continue
    fi
done

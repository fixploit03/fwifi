# fwifi

![License](https://img.shields.io/github/license/fixploit03/fwifi?style=flat)  
![Issues](https://img.shields.io/github/issues/fixploit03/fwifi?style=flat)  
![Last Commit](https://img.shields.io/github/last-commit/fixploit03/fwifi?style=flat)  
![Stars](https://img.shields.io/github/stars/fixploit03/fwifi?style=flat)  
![Forks](https://img.shields.io/github/forks/fixploit03/fwifi?style=flat)  


fwifi adalah script Bash yang dirancang untuk melakukan proses hacking Wi-Fi secara otomatis menggunakan alat-alat dari suite Aircrack-ng. Script ini memungkinkan pengguna untuk memindai jaringan Wi-Fi, menangkap handshake, memverifikasi handshake, dan mencoba memecahkan kata sandi WPA2/PSK menggunakan wordlist.

## Persyaratan

Untuk menginstal dan menjalankan fwifi, Anda harus memenuhi persyaratan berikut ini:

1. **Sistem Operasi**  
   Linux-based OS (disarankan Kali Linux).

2. **W-Fi Adapter**  
   WiFi-Adapter yang support mode monitor, contohnya: `TP-Link TL-WN722N`, `Alfa AWUS036H`, `Alfa AWUS1900`, dan lain-lain.
   
4. **Dependensi**  
   - aircrack-ng
   - cowpatty
   - xterm
   - iwconfig

## Cara Instal

Untuk cara instal fwifi ada disini: [https://github.com/fixploit03/fwifi/blob/main/INSTAL](https://github.com/fixploit03/fwifi/blob/main/INSTAL)

## Cara Penggunaan

Jalankan script sebagai root.

```
sudo fwifi
```

Ikuti langkah-langkahnya step by step sesuai dengan instruksi yang diberikan.

## Peringatan

Script ini disediakan hanya untuk tujuan pendidikan dan pengujian penetrasi etis. Hanya gunakan pada jaringan yang Anda miliki atau memiliki izin eksplisit untuk diuji. Akses tidak sah ke jaringan komputer adalah ilegal dan dapat dihukum berdasarkan berbagai hukum.


## Kredit

- **Dibuat oleh**: Rofi (Fixploit03)
- **Ditenagai oleh Aircrack-ng**: [https://github.com/aircrack-ng/aircrack-ng](https://github.com/aircrack-ng/aircrack-ng)

## Lisensi

Proyek ini dilisensikan dibawah [lisensi MIT](https://github.com/fixploit03/fwifi/blob/main/LICENSE).

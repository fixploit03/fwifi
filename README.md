## WI-FI HACKING

## Peralatan

Berikut ini adalah alat-alat yang diperlukan untuk melakukan peretasan WI-FI.

- Sistem operasi Kali Linux
- WI-FI Adapter TP-Link TLWN722N
- Tools Aircrack-ng
- Wordlist rockyou.txt

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

```
$ sudo apt-get update -y
$ sudo apt-get upgrade -y
$ sudo apt-get install git -y
$ git clone https://github.com/rofidoang03/wifi-hacking/
$ cd wifi-hacking/rtl8188eus
$ chmod +x instal.sh
$ ./instal.sh
```

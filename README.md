# FWIFI

![FWIFI](https://github.com/rofidoang03/fwifi/blob/main/fwifi.jpg)

> **WARNING**: This script is designed exclusively for educational and authorized testing purposes. Unauthorized access to networks or systems is strictly prohibited. Users must adhere to local laws and regulations. The author is not liable for any misuse or damage caused by this script. By using FWIFI, you acknowledge and agree to these terms.

## Overview

FWIFI is a powerful wireless security testing toolkit designed for educational and authorized testing purposes. It provides a collection of essential tools for assessing and securing Wi-Fi networks.

## Features

- **User-friendly Interface**: FWIFI offers a simple and intuitive command-line interface, making it accessible for both beginners and experienced users.
- **Monitor Mode Management**: Enable and disable monitor mode using airmon-ng, providing flexibility for various wireless testing scenarios.
- **Wi-Fi Data Capture**: Utilize airodump-ng and besside-ng to capture Wi-Fi data, including essential information about Access Points (APs) and clients.
- **Packet Injection**: Use aireplay-ng to inject Wi-Fi packets, allowing users to test network robustness and security.
- **WPA/WPA2 Key Cracking**: Employ aircrack-ng for WPA/WPA2 key cracking, utilizing handshake files and wordlists for enhanced security assessment.
- **Cowpatty Integration**: Integrate cowpatty to check for valid 4-way frames during the WPA/WPA2 key cracking process.

## Requirements

- Debian-based Linux operating system
- WiFi adapter (TPLINK TLWN723N)
- Active internet connection

## How to Install

> Ensure you are in superuser (root) mode before installing FWIFI.

```
apt-get update -y ; apt-get upgrade -y ; apt-get install git -y ; git clone https://github.com/rofidoang03/fwifi/ ; cd fwifi ; chmod +x build.sh ; ./build.sh
```

## How to Run

```
fwifi -i <interface>
```

## Responsible Usage

Explore FWIFI responsibly to enhance your Wi-Fi security knowledge. Exercise caution and ensure compliance with ethical and legal standards while using FWIFI.

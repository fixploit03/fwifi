# FWIFI

![FWIFI](https://github.com/rofidoang03/fwifi/blob/main/fwifi.jpg)

> **WARNING**: This script is designed exclusively for educational and authorized testing purposes. Unauthorized access to networks or systems is strictly prohibited. Users must adhere to local laws and regulations. The author is not liable for any misuse or damage caused by this script. By using FWIFI, you acknowledge and agree to these terms.

## Overview

FWIFI is a Bash script crafted to facilitate educational and authorized Wi-Fi penetration testing. It aims to contribute to a deeper understanding of Wi-Fi security by providing various functionalities tailored for diverse testing tasks.

## Features

- Enable Monitor Mode (airmon-ng).
- Disable Monitor Mode (airmon-ng).
- Capture Wi-Fi Data (airodump-ng).
- Inject Wi-Fi Packets (aireplay-ng).
- Crack Wi-Fi Key (aircrack-ng).

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

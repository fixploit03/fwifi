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

- Linux operating system (Debian-based)
- Bash shell
- Root access (sudo privileges)
- WiFi adapter (TPLINK TLWN723N)
- Active internet connection

## Getting Started

```
# Navigate to the share directory
# cd /usr/share

# Clone the repository
$ git clone https://github.com/rofidoang03/fwifi.git

# Navigate to the FWIFI directory
$ cd fwifi

# Make the script executable
$ chmod +x build.sh

# Run the script
$ ./build.sh
```

## How to Run

```
fwifi -i <interface>
```

## Contributions

Contributions to FWIFI are welcome! If you have any suggestions, improvements, or bug fixes, feel free to submit a pull request on the GitHub repository.

## License
FWIFI is released under the MIT License. Please review the license before using or contributing to the project.

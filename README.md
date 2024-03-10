# FWIFI

![FWIFI](https://github.com/rofidoang03/fwifi/blob/main/fwifi.jpg)

> **WARNING**: This script is designed exclusively for educational and authorized testing purposes. Unauthorized access to networks or systems is strictly prohibited. Users must adhere to local laws and regulations. The author is not liable for any misuse or damage caused by this script. By using FWIFI, you acknowledge and agree to these terms.

## Overview

FWIFI is a powerful wireless security testing toolkit designed for educational and authorized testing purposes. It provides a collection of essential tools for assessing and securing Wi-Fi networks.

## Features

- **Interactive Menu Interface:** Provides an interactive menu for various wireless security testing options.
- **Monitor Mode:** Enables and disables monitor mode using `airmon-ng`.
- **Capture Wi-Fi Data:** Captures Wi-Fi data using `airodump-ng` with user input for BSSID, channel, and output file.
- **Capture Wi-Fi Data (besside-ng):** Alternative method for capturing Wi-Fi data using `besside-ng`.
- **Inject Wi-Fi Packets:** Uses `aireplay-ng` to inject Wi-Fi packets, prompting the user for the MAC address of the access point.
- **Check for Valid 4-way Frames:** Checks for valid 4-way frames using `cowpatty` with user input for the handshake file.
- **Crack Wi-Fi Key (aircrack-ng):** Cracks Wi-Fi key using `aircrack-ng` with prompts for handshake file and wordlist.
- **Crack Wi-Fi Key (cowpatty):** Alternative method for cracking Wi-Fi key using `cowpatty` with prompts for SSID, handshake file, and wordlist.
- **Wordlist Options:** Provides predefined wordlist options or allows the user to input a custom wordlist.

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

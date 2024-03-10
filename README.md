# FWIFI

![FWIFI](https://github.com/rofidoang03/fwifi/blob/main/fwifi.jpg)

<p align="center">- since 2021 -</p>

> **WARNING**: This script is designed exclusively for educational and authorized testing purposes. Unauthorized access to networks or systems is strictly prohibited. Users must adhere to local laws and regulations. The author is not liable for any misuse or damage caused by this script. By using FWIFI, you acknowledge and agree to these terms.

## Overview

FWIFI is a powerful wireless security testing toolkit designed for educational and authorized testing purposes. It provides a collection of essential tools for assessing and securing Wi-Fi networks.

## Features
1. **Comprehensive Wi-Fi Security Assessment**: FWIFI includes a set of tools that allow you to perform a thorough assessment of Wi-Fi network security. From enabling monitor mode to capturing data and injecting packets, it covers a wide range of testing scenarios.
2. **User-Friendly Menu System**: The script features an easy-to-use menu system, making it accessible for both beginners and experienced users. The menu allows you to perform various tasks such as updating, enabling monitor mode, capturing Wi-Fi data, and more with simple user inputs.
3. **Flexible Wi-Fi Data Capture**: Choose between `airodump-ng` and `besside-ng` for capturing Wi-Fi data. This flexibility allows you to adapt the tool to different testing scenarios and preferences.
4. **Efficient Wi-Fi Key Cracking**: FWIFI supports both `aircrack-ng` and `cowpatty` for Wi-Fi key cracking. Additionally, it provides a selection of predefined wordlists and the option to use a custom wordlist, enhancing the efficiency of the cracking process.

## Requirements

- Linux operating system (Debian-based)
- Bash shell
- Root access (sudo privileges)
- WiFi adapter (TPLINK TLWN722N)
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

## NOtes

- Use this script responsibly and only on networks for which you have explicit permission to test security.
- Misuse of this tool may lead to legal consequences.
- The author does not assume any responsibility for misuse or damage caused by the script.

## Contributions

Contributions to FWIFI are welcome! If you have any suggestions, improvements, or bug fixes, feel free to submit a pull request on the GitHub repository.

## License
FWIFI is released under the MIT License. Please review the license before using or contributing to the project.

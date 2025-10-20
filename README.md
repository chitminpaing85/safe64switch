# safe64switch
Safe 64-bit enable script for Raspberry Pi with rollback timer

# Safe64 Script

**Purpose:** Safely switch Raspberry Pi OS from 32-bit to 64-bit.

## Features
- Checks if running on Raspberry Pi
- Backs up `/boot/config.txt`
- Enables 64-bit kernel
- Adds optional performance settings

## Usage
```bash
chmod +x safe64.sh
sudo ./safe64.sh

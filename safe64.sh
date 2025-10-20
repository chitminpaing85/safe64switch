#!/bin/bash
# safe64.sh
# Purpose: Safely switch Raspberry Pi OS to 64-bit

# Exit on any error
set -e

echo "Starting safe64.sh script..."

# Check if running on Raspberry Pi
if ! grep -q "Raspberry Pi" /proc/device-tree/model 2>/dev/null; then
    echo "Error: Not running on a Raspberry Pi. Exiting."
    exit 1
fi

# Backup current config
echo "Backing up /boot/config.txt to /boot/config.txt.bak"
cp /boot/config.txt /boot/config.txt.bak

# Enable 64-bit kernel
if ! grep -q "^arm_64bit=1" /boot/config.txt; then
    echo "Enabling 64-bit kernel..."
    echo "arm_64bit=1" >> /boot/config.txt
else
    echo "64-bit kernel already enabled."
fi

# Optionally, enable other performance settings
echo "Adding performance settings..."
grep -qxF "gpu_mem=16" /boot/config.txt || echo "gpu_mem=16" >> /boot/config.txt

echo "64-bit mode enabled. Please reboot the system to apply changes."
echo "Done."

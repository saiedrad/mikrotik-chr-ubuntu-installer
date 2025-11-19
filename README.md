# MikroTik CHR Installer on Ubuntu (Headless Mode)

A simple script to install and run MikroTik CHR (Cloud Hosted Router) on Ubuntu-based VPS without needing a GUI.

Perfect for headless servers and VPS environments.

## Features

- Runs without GUI (no GTK errors).
- Uses QEMU/KVM in headless mode.
- Auto-forwards port 8291 for Winbox access.
- Includes an interactive menu for install/stop/cleanup.

## Prerequisites

- Ubuntu 20.04 or higher
- `sudo` access
- Internet connection

## Installation

1. Download the script:

```bash
wget https://raw.githubusercontent.com/YOUR_USERNAME/mikrotik-chr-installer/main/mikrotik-menu.sh
Make it executable:
bash


1
chmod +x mikrotik-menu.sh
Run the script:
bash


1
./mikrotik-menu.sh
Usage
Install: Downloads and runs CHR v7.20 in background.
Stop: Stops the VM and optionally removes the image file.
Exit: Exits the menu.
After installation, connect using Winbox to YOUR_VPS_IP:8291.[mikrotik-menu.sh](https://github.com/user-attachments/files/23638008/mikrotik-menu.sh)

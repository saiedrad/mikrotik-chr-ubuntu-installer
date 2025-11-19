# mikrotik-chr-ubuntu-installer
A headless script to install MikroTik CHR on Ubuntu VPS. No GUI, no GTK errors. Perfect for VPN services.
# 🚀 MikroTik CHR Installer on Ubuntu (Headless + SSH Friendly)

[![MikroTik](https://img.shields.io/badge/MikroTik-CHR-blue?logo=mikrotik&logoColor=white)](https://mikrotik.com)
[![SanSystem](https://img.shields.io/badge/SanSystem-Official-blue?style=for-the-badge&logo=appveyor)](https://github.com/amirvv)

A one-line, automated script to install and run **MikroTik Cloud Hosted Router (CHR)** on any Ubuntu-based VPS — **without GUI, without GTK errors, without hassle.**

Perfect for:
- Running a private VPN service
- Reselling internet access
- Testing RouterOS features
- Building your own "SanSystem" network services

✅ Works on **Iranian VPS**  
✅ No GUI required  
✅ Uses `-nographic` + `screen`  
✅ Auto-forwards Winbox (port 8291)  
✅ Supports RouterOS **v7.20+**  
✅ Unlimited license compatible

---

## 📋 Table of Contents

- [Features](#-features)
- [Installation](#-installation)
- [Usage](#-usage)
- [Commands](#-commands)
- [Examples](#-examples)
- [Troubleshooting](#-troubleshooting)
- [License](#-license)
- [About SanSystem](#-about-sansystem)

---

## ✨ Features

- **One-Click Install**: Just copy-paste a single command.
- **Headless Mode**: No GUI, no GTK errors, perfect for VPS.
- **Auto-Port Forwarding**: Winbox accessible via `IP:8291`.
- **Persistent VM**: Runs in background with `screen`.
- **Latest RouterOS**: v7.20 by default.
- **Unlimited License Compatible**: Works with `P` license.

---

## 💥 Installation (One-Liner)

```bash
sudo apt install -y screen wget unzip qemu-utils && wget -O chr.zip https://download.mikrotik.com/routeros/7.20/chr-7.20.img.zip && unzip chr.zip && screen -dmS mikrotik sudo qemu-system-x86_64 -drive file=chr-7.20.img,if=virtio -boot d -m 512M -smp 1 -netdev user,id=mynet0,hostfwd=tcp::8291-:8291 -device virtio-net-pci,netdev=mynet0 -nographic

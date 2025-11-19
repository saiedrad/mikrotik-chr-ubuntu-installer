# 🚀 MikroTik CHR Installer on Ubuntu (Headless + SSH Friendly)

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

## 💥 One-Liner Install (Copy & Paste)

```
sudo apt install -y screen wget unzip qemu-utils && wget -O chr.zip https://download.mikrotik.com/routeros/7.20/chr-7.20.img.zip && unzip chr.zip && screen -dmS mikrotik sudo qemu-system-x86_64 -drive file=chr-7.20.img,if=virtio -boot d -m 512M -smp 1 -netdev user,id=mynet0,hostfwd=tcp::8291-:8291 -device virtio-net-pci,netdev=mynet0 -nographic 
```
📌 After Installation

1.Wait 60 seconds for boot.

2.Open Winbox on your PC → Connect to:
```
IP_OF_YOUR_VPS:8291
```
Login with:

User: admin

  Password: (leave blank first time)
  
🔐 Set password after first login:

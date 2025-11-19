cat > mikrotik-menu.sh << 'EOF'
#!/bin/bash

# MikroTik CHR Manager for Ubuntu (Headless)
# A simple menu to install, stop, or exit MikroTik CHR on VPS

SCRIPT_NAME="mikrotik.qcow2"
VM_SCREEN="mikrotik"
QEMU_PID=$(pgrep -f "qemu-system-x86_64.*$SCRIPT_NAME")

show_menu() {
    clear
    echo "========================================"
    echo "     🛠️  MikroTik CHR Management Menu   "
    echo "========================================"
    echo "1) Install & Start MikroTik CHR v7.20"
    echo "2) Stop & Clean Up VM"
    echo "3) Exit"
    echo "========================================"
}

start_vm() {
    if [ ! -f "$SCRIPT_NAME" ]; then
        echo "🟡 Downloading MikroTik CHR v7.20..."
        wget -O chr.zip https://download.mikrotik.com/routeros/7.20/chr-7.20.img.zip && unzip chr.zip && mv chr-7.20.img "$SCRIPT_NAME"
        if [ $? -ne 0 ]; then
            echo "❌ Download or extraction failed."
            exit 1
        fi
    else
        echo "✅ Image file already exists."
    fi

    if screen -list | grep -q "$VM_SCREEN"; then
        echo "⚠️ VM is already running (screen: $VM_SCREEN)."
        echo "   Use option 2 to stop it first."
    else
        echo "🚀 Starting MikroTik CHR in background..."
        screen -dmS "$VM_SCREEN" sudo qemu-system-x86_64 \
          -drive file="$SCRIPT_NAME",if=virtio \
          -boot d \
          -m 512M \
          -smp 1 \
          -netdev user,id=mynet0,hostfwd=tcp::8291-:8291 \
          -device virtio-net-pci,netdev=mynet0 \
          -nographic

        echo "✅ MikroTik CHR is now running!"
        echo "🔗 Connect via Winbox: YOUR_VPS_IP:8291"
        echo "👤 Default login: admin (no password)"
    fi
}

stop_vm() {
    if screen -list | grep -q "$VM_SCREEN"; then
        echo "🛑 Stopping MikroTik VM..."
        screen -S "$VM_SCREEN" -X quit
        sudo pkill -f "qemu-system-x86_64.*$SCRIPT_NAME" 2>/dev/null || true
        echo "✅ VM stopped."
    else
        echo "ℹ️ No running VM found."
    fi

    read -p "Do you want to delete the image file ($SCRIPT_NAME)? (y/N): " DEL_IMG
    if [[ "$DEL_IMG" =~ ^[Yy]$ ]]; then
        rm -f "$SCRIPT_NAME"
        echo "🗑️ Image file deleted."
    fi
}

while true; do
    show_menu
    read -p "Choose (1-3): " choice

    case $choice in
        1) start_vm ;;
        2) stop_vm ;;
        3) echo "👋 Goodbye!" ; exit ;;
        *) echo "❌ Invalid option." ;;
    esac

    read -p "Press Enter to continue..."
done
EOF
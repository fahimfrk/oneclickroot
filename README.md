# ⚡ OneClickRoot — Lava Play Ultra

A simple cross-platform rooting toolkit for the **Lava Play Ultra**, supporting **Windows and Linux**.

It provides automated workflows for bootloader unlocking, Magisk, KernelSU, APatch, and root removal.

> [!CAUTION]
> **Bootloader unlocking erases user data. Rooting can cause bootloops or device failure if incorrect files are used. Use at your own risk and back up your data before proceeding.**

## 📱 Supported Device

- Lava Play Ultra 5G

## 💻 Supported Platforms

- 🪟 Windows
- 🐧 Linux

## 📦 Requirements

### Windows

- Python 3
- ADB & Fastboot Platform Tools
- USB debugging enabled
- OEM unlocking enabled

### Linux

- Python 3
- ADB & Fastboot Platform Tools
- USB debugging enabled
- OEM unlocking enabled

## 🚀 Installation

Download the appropriate **`.tar.xz` release archive** from the GitHub Releases section and extract it.

### Windows

Open **PowerShell inside the extracted directory** and run:

```powershell
python oneclickroot.py
```

The Python launcher automatically detects Windows and runs `windows.ps1`.

### Linux

Open a terminal inside the extracted directory and run:

```bash
python3 oneclickroot.py
```

The launcher automatically detects Linux and runs `linux.sh`.

If you get a permission error:

```bash
chmod +x linux.sh
```

Then run the Python launcher again.

## 📋 Main Menu

The launcher provides options for:

```text
1. 🔓 Unlock Bootloader
2. 📦 Root Existing Unlocked Device
   ├── Magisk
   ├── KernelSU
   └── APatch
3. 🚀 Unlock Bootloader + Root
4. 🗑️ Remove Root
5. 🛠️ TWRP Personal Build
0. ❌ Exit
```

Choose the required operation and follow the on-screen instructions.

## 🔐 Root Managers

Supported methods:

- **Magisk**
- **KernelSU**
- **APatch**

For an already-unlocked device, choose **Root Existing Unlocked Device** and select your preferred method.

## 📦 Release Dependencies

Device-specific dependencies and required images are distributed through the **GitHub Release archives** rather than stored directly in the source repository.

Download the complete archive before running the tool.

## ⚠️ Important

- Unlocking the bootloader **wipes the device**.
- Do not disconnect the USB cable while flashing.
- Do not flash images from another device.
- Keep the original stock firmware as a recovery option.
- This project is intended for the **Lava Play Ultra**.

## 📜 Open Source & Attribution

This project is released under the **GNU General Public License (GPL)**.

You are free to:

- Use the project
- Study the source code
- Modify it
- Redistribute it
- Use it as the basis for your own project

### Attribution Required

If you use or modify this project, **credit the original author, FHM**, and clearly mention the original project/source.

If you distribute a modified or derivative version, **keep it open source and release your modifications under the GNU GPL as required by the license**.

Please do not remove the original copyright/license notices or present the original work as your own.

## ⭐ Credits

**Original Project:** OneClickRoot by FHM  
**Device:** Lava Play Ultra

If this project helped you, consider giving the repository a ⭐.

---

### ⚡ OneClickRoot by FHM

**Open Source • Windows • Linux • Magisk • KernelSU • APatch**

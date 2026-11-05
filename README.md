# ⚡ OneClickRoot — Lava Play Ultra

A comprehensive, cross-platform rooting toolkit and graphical user interface (**GUI & CLI**) for the **Lava Play Ultra 5G**, natively supporting **Windows and Linux**.

It provides automated, one-click workflows for bootloader unlocking, Magisk, KernelSU, APatch deployment, manager APK installation, and complete root removal.

<div align="center">

![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux-blue?style=for-the-badge&logo=linux)
![Interface](https://img.shields.io/badge/Interface-GUI%20%7C%20CLI-brightgreen?style=for-the-badge)
![Device](https://img.shields.io/badge/Device-Lava%20Play%20Ultra%205G-orange?style=for-the-badge&logo=android)
![License](https://img.shields.io/badge/License-GNU%20GPL%20v3-red?style=for-the-badge)

</div>

> [!CAUTION]
> **Bootloader unlocking automatically erases all user data.** Rooting can cause bootloops or device failure if incorrect files or steps are used. Use at your own risk and create a complete backup of your data before proceeding.

---

## 📱 Supported Device

- **Device:** Lava Play Ultra 5G
- **Model:** LXX521
- **SoC:** MediaTek Dimensity 7300

---

## 💻 Supported Platforms

- 🪟 **Windows** (Windows 10 / 11)
- 🐧 **Linux** (Ubuntu, Debian, Fedora, Arch, Linux Mint, etc.)

---

## 📦 Requirements & Prerequisites

### Computer Requirements
- **Python 3** (Python 3.8+ recommended)
- **ADB & Fastboot Platform Tools** (installed and accessible in system PATH)
- Proper USB data cable (use original or high-speed data cable)

### Phone Setup (Crucial)
1. Open **Settings** → **About Phone** → Tap **Build Number** 7 times until Developer Mode is unlocked.
2. Go to **Settings** → **System** → **Developer Options**.
3. Enable **OEM Unlocking**.
4. Enable **USB Debugging**.
5. Connect your phone to your PC via USB.
6. When prompted on your phone screen, check **"Always allow from this computer"** and tap **Allow**.

---

## 🚀 Installation

Download the latest release archive (`.tar.xz` or `.zip`) from the **GitHub Releases** section and extract it to a folder on your computer.

```
oneclickroot-CROSSPLATFORM/
├── dependencies/              # Root images, vbmeta, and manager APKs
├── core_engine.py             # Shared cross-platform backend engine
├── gui_tk.py                  # Native Tkinter desktop GUI
├── gui_web.py                 # Embedded zero-dependency web desktop GUI
├── oneclickroot_gui.py        # GUI launcher
├── oneclickroot.py            # Universal launcher (GUI & CLI)
├── linux.sh                   # Linux interactive CLI script
├── windows.ps1                # Windows interactive CLI PowerShell script
├── run_gui.sh                 # Linux one-click GUI launcher
├── run_gui.bat                # Windows one-click GUI launcher
└── run_cli.bat                # Windows one-click CLI launcher
```

---

## 🖥️ Graphical User Interface (GUI)

OneClickRoot features an intelligent dual-interface GUI system:
1. **Native Desktop Window (Tkinter / TTK)**: Sleek, high-performance native desktop window.
2. **Modern Embedded Web App (Zero External Dependencies)**: Runs a local built-in server and launches in a dedicated browser/Chrome app window. Used automatically as a lightweight fallback if native desktop display libraries are absent.

### Launching the GUI

#### 🪟 On Windows:
- **Option 1 (Easiest):** Double-click `run_gui.bat`.
- **Option 2 (PowerShell / Command Prompt):**
  ```powershell
  python oneclickroot.py
  # or
  python oneclickroot_gui.py
  ```

#### 🐧 On Linux:
- **Option 1 (Easiest):** Run the shell helper:
  ```bash
  chmod +x run_gui.sh
  ./run_gui.sh
  ```
- **Option 2 (Terminal):**
  ```bash
  python3 oneclickroot.py
  # or
  python3 oneclickroot_gui.py
  ```

*(Note for Linux: If `tkinter` is not installed on your distro, the GUI automatically launches the embedded Web GUI. To enable the native desktop window on Ubuntu/Debian, run: `sudo apt install python3-tk`)*

#### ⚙️ GUI Command-Line Options:
```bash
python3 oneclickroot_gui.py --web          # Force the Modern Embedded Web GUI
python3 oneclickroot_gui.py --tk           # Force the Native Tkinter Desktop GUI
python3 oneclickroot_gui.py --port 5050    # Custom port for Web GUI (default: 5050)
python3 oneclickroot_gui.py --no-browser   # Run Web GUI server without opening browser
```

---

### 🎮 GUI Operations & Features

The GUI presents a clean dashboard divided into clear sections:

| Feature | Description |
|---|---|
| **📡 Device Monitor** | Continuously monitors ADB and Fastboot connections. Displays current serial number and state (**ADB Authorized**, **Fastboot Mode**, or **Disconnected**). |
| **🚀 1-Click Unlock & Root** | The recommended automated path. Reboots phone to bootloader, executes unlock, prompts on-screen confirmation, flashes patched `vbmeta.img` (verity disabled) alongside your chosen root framework (`Magisk`, `KernelSU`, or `APatch`), reboots into Android, and installs the manager APK. |
| **🔓 Unlock Bootloader** | Standalone bootloader unlocker. Sends `fastboot flashing unlock`, provides clear instructions for pressing the device volume key to confirm, and flashes patched verification-disabled `vbmeta.img`. |
| **📦 Root Existing Unlocked** | Flashes your selected root method directly to an already unlocked device without performing another bootloader unlock or data wipe. |
| **🗑️ Remove Root (Stock Restore)**| Flashes clean stock `boot.img` and `init_boot.img` to completely restore stock boot partitions and unroot the device. |
| **📲 Install Root Manager** | Reboots device from fastboot into Android system, polls for ADB connection, and pushes/installs the required manager APK (`magisk.apk`, `kernelsu.apk`, or `apatch.apk`). |
| **🔄 Power & Reboot Controls** | Fast one-click reboot shortcuts to **System**, **Bootloader / Fastboot**, or **Recovery**. |
| **💻 Live Console Terminal** | Built-in real-time log terminal showing step-by-step progress, timestamps, command outputs, and color-coded status messages. |

---

## ⌨️ Command Line Interface (CLI)

Prefer working directly in the terminal? OneClickRoot includes full-featured native interactive CLI scripts for both platforms with 100% feature parity.

### Launching the CLI

#### Universal Launcher (Cross-Platform):
```bash
# Windows
python oneclickroot.py --cli

# Linux
python3 oneclickroot.py --cli
```

#### Directly on Windows:
- Double-click `run_cli.bat`, or
- Open PowerShell in the extracted directory and run:
  ```powershell
  powershell -ExecutionPolicy Bypass -File windows.ps1
  ```

#### Directly on Linux:
- Open a terminal in the extracted directory and run:
  ```bash
  chmod +x linux.sh
  ./linux.sh
  ```

---

### 📋 CLI Main Menu

When launched in CLI mode, the interactive menu presents:

```text
=====================================================
          ⚡ OneClickRoot — Lava Play Ultra
=====================================================
1. 🔓 Unlock Bootloader
2. 📦 Root Existing Unlocked Device
   ├── Magisk
   ├── KernelSU
   └── APatch
3. 🚀 Unlock Bootloader + Root (Recommended)
4. 🗑️ Remove Root & Restore Stock
5. 🛠️ TWRP Personal Build
0. ❌ Exit
=====================================================
```

Choose your desired option number and follow the step-by-step terminal prompts.

---

## 🔐 Supported Root Frameworks

You can choose between three modern rooting solutions:

- **Magisk**: The industry standard for systemless root and module support. Deployed via patched `init_boot.img` alongside verity-disabled `vbmeta.img`.
- **KernelSU**: Kernel-based root offering superior isolation and stealth. Deployed via `kernelsu_init.img`.
- **APatch**: Modern KernelPatch-based root solution combining kernel patching with modular su management. Deployed via `apatch_patched_boot.img`.

---

## 📦 Release Dependencies

Device-specific partition images (`boot.img`, `init_boot.img`, patched images, and disabled `vbmeta.img`) and manager APKs are distributed through the **GitHub Release archives** rather than stored raw inside the Git source tree.

Always ensure you download the complete pre-packaged `.tar.xz` or `.zip` release archive before running the tool.

---

## ⚠️ Important Safety Notes

- Unlocking the bootloader **wipes all user data**. Always backup photos, contacts, and personal files first.
- Keep your phone connected; **never disconnect the USB cable while a partition is being flashed**.
- Never flash images intended for another device or SoC. This toolkit is specifically built for the **Lava Play Ultra (MT6878 / Dimensity 7300)**.
- Always retain your device's original stock firmware as a recovery safeguard.

---

## 📜 Open Source & Attribution

This project is released under the **GNU General Public License (GPL)**.

You are free to:
- Use this project for personal or community purposes.
- Study the source code and internal ADB/Fastboot engine.
- Modify and customize the scripts and interfaces.
- Redistribute and adapt it as a foundation for compatible Dimensity 7300 devices.

### Attribution Required
If you use or modify this project:
- **Credit the original author, FHM**, and clearly reference this repository.
- If distributing modified or derivative versions, **keep them open source and release your modifications under the GNU GPL as required by the license**.
- Retain all original copyright and author attribution notices.

---

## ⭐ Credits

- **Original Project:** OneClickRoot by **FHM**
- **Target Device:** Lava Play Ultra 5G (LXX521)
- **Community:** XDA Developers & Android Rooting Community

If this project made rooting your Lava Play Ultra fast and easy, please consider giving this repository a ⭐!

---

<div align="center">

### ⚡ OneClickRoot by FHM
**Open Source • Windows • Linux • GUI • CLI • Magisk • KernelSU • APatch**

</div>

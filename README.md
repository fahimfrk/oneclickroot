<!-- Meta Tags for GitHub Search & Web Indexing -->
# How to Root Lava Play Ultra | One-Click Root Script (Linux)

> **The complete, automated root solution and custom script for Lava Play Ultra using Bash on Linux.**

[![GitHub Stars](https://img.shields.io/github/stars/YOUR_USERNAME/YOUR_REPO_NAME?style=flat-square&logo=github)](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/YOUR_USERNAME/YOUR_REPO_NAME?style=flat-square&logo=github)](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME/network/members)
[![GitHub Issues](https://img.shields.io/github/issues/YOUR_USERNAME/YOUR_REPO_NAME?style=flat-square&logo=github)](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME/issues)

---

## Overview

This repository provides an automated **One-Click Root Script (`oneclickroot.sh`)** specifically designed for the **Lava Play Ultra** smartphone. Built natively for Linux environments, it automates unlocking, patched boot image installation, and Magisk root deployment via ADB and Fastboot platform tools.

<div align="center">

# ⚡ One-Click Root for Lava Play Ultra

A streamlined Bash automation script to simplify the rooting process on the **Lava Play Ultra**.

![Platform](https://img.shields.io/badge/Platform-Linux-orange?style=for-the-badge&logo=linux)
![Shell](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash)
![Device](https://img.shields.io/badge/Device-Lava%20Play%20Ultra-blue?style=for-the-badge&logo=android)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

</div>

---

> [!CAUTION]
> **Disclaimer:** Rooting your device carries inherent risks, including potential data loss or bricking if steps are skipped. Proceed at your own risk. Always back up your important data first!

---

## 📋 System Requirements

* **OS:** Any Linux distribution *(Windows is currently **not supported**)*
* **Tools:** ADB & Fastboot Platform Tools for Linux
* **Device:** Lava Play Ultra (USB Debugging enabled)

---

## ⚙️ Pre-requisites & Setup

Before running the script, complete these essential steps on your phone:

1. Open **Settings** → **About Phone** → Tap **Build Number** 7 times to enable **Developer Options**.
2. Go to **Settings** → **System** → **Developer Options**.
3. Enable **OEM Unlocking**.
4. Enable **USB Debugging**.
5. Connect your device to your Linux machine via USB.

---

## 🚀 Quick Start Guide

Open your Linux terminal and run the following commands:

### 1. Clone the Repository
```bash
git clone [https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git)
cd YOUR_REPO_NAME
chmod +x oneclickroot.sh
bash oneclickroot.sh

```powershell
$progress = 0

$serial = (adb devices | Select-String "\sdevice$" | ForEach-Object {
    ($_ -split "\s+")[0]
} | Select-Object -First 1)


function bootloaderunlock() {

    Write-Host ""
    Write-Host "══════════════════════════════════════════════════════"
    Write-Host "🔓 Bootloader Unlock"
    Write-Host ""
    Write-Host "A confirmation screen should now be visible on your device."
    Write-Host "Use the Volume buttons to select 'Unlock the bootloader',"
    Write-Host "then press the Power button to confirm."
    Write-Host "⚠️  This will erase all data on your device."
    Write-Host "══════════════════════════════════════════════════════"

    Start-Sleep -Seconds 5

    fastboot -s $serial flashing unlock

    $CONFIRM = Read-Host "Proceed only after you have confirmed the bootloader unlock on your device (Volume Up). Enter 1 to continue, or Enter 0 to cancel"

    if ($CONFIRM -eq "1") {

        fastboot -s $serial --disable-verity --disable-verification flash vbmeta "dependencies/lavaplayultra/vbmeta/vbmeta.img"

        Write-Host "Bootloader unlocked successfully"

        menu
    }
    else {
        menu
    }
}


function rootselection() {

    Write-Host "══════════════════════════════════════════════════════"
    Write-Host "             Root Framework Selection"
    Write-Host "══════════════════════════════════════════════════════"
    Write-Host "1. Magisk (Recommended)"
    Write-Host "2. KernelSU"
    Write-Host "3. APatch"
    Write-Host "4. Remove Root Completely"
    Write-Host "0. Cancel"
    Write-Host "══════════════════════════════════════════════════════"

    $root_choice = Read-Host "Select an option"

    switch ($root_choice) {

        "1" {
            fastboot -s $serial --disable-verity --disable-verification flash vbmeta "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            fastboot -s $serial flash init_boot_a "dependencies/lavaplayultra/rootmethods/magisk_20251111.img"
            fastboot -s $serial flash init_boot_b "dependencies/lavaplayultra/rootmethods/magisk_20251111.img"

            Write-Host "Rooted device completely...please install root manager from the official sources"

            menu
        }

        "2" {
            fastboot -s $serial --disable-verity --disable-verification flash vbmeta "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            fastboot -s $serial flash init_boot_a "dependencies/lavaplayultra/rootmethods/kernelsu_init.img"
            fastboot -s $serial flash init_boot_b "dependencies/lavaplayultra/rootmethods/kernelsu_init.img"

            Write-Host "Rooted device completely...please install root manager from the official sources"

            menu
        }

        "3" {
            fastboot -s $serial --disable-verity --disable-verification flash vbmeta "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            fastboot -s $serial flash boot_a "dependencies/lavaplayultra/rootmethods/apatch_patched_boot.img"
            fastboot -s $serial flash boot_b "dependencies/lavaplayultra/rootmethods/apatch_patched_boot.img"

            Write-Host "Rooted device completely...please install root manager from the official sources"

            menu
        }

        "4" {
            fastboot -s $serial flash init_boot_a "dependencies/lavaplayultra/rootmethods/init_boot.img"
            fastboot -s $serial flash init_boot_b "dependencies/lavaplayultra/rootmethods/init_boot.img"
            fastboot -s $serial flash vbmeta_a "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            fastboot -s $serial flash vbmeta_b "dependencies/lavaplayultra/vbmeta/vbmeta.img"

            Write-Host "root removed completely"

            menu
        }

        "0" {
            Write-Host "Operation cancelled."
            menu
        }

        default {
            Write-Host "❌ Invalid selection."
            rootselection
        }
    }
}


function oneclickroot() {

    Write-Host "⚡ Automatically unlocks the bootloader, then allows you to select your preferred root framework (Magisk, KernelSU, or APatch)."

    bootloaderunlock

    Write-Host "══════════════════════════════════════════════════════"
    Write-Host "Created by Fahim (@fahimfrk_)"
    Write-Host ""
    Write-Host "⭐ If you found this tool helpful, consider giving it a GitHub star."
    Write-Host "Your support helps improve the project."
    Write-Host ""
    Write-Host "Feel free to use, modify, and contribute to this script."
    Write-Host "Let's add support for even more devices together!"
    Write-Host "══════════════════════════════════════════════════════"

    rootselection

    Write-Host "🎉 Root completed successfully!"
    Write-Host ""
}


function install_root_managers() {

    Write-Host "══════════════════════════════════════════════════════"
    Write-Host "Created by Fahim (@fahimfrk_)"
    Write-Host ""
    Write-Host "⭐ If you found this tool helpful, consider giving it a GitHub star."
    Write-Host "Your support helps improve the project."
    Write-Host ""
    Write-Host "Feel free to use, modify, and contribute to this script."
    Write-Host "Let's add support for even more devices together!"
    Write-Host "══════════════════════════════════════════════════════"

    if (-not (adb get-state 2>$null)) {

        Write-Host "⏳ Waiting for ADB device connection... (Ensure USB debugging is enabled)"

        while (-not (adb get-state 2>$null)) {
            Start-Sleep -Seconds 1
        }

        Write-Host "✅ Device connected successfully!"
        Write-Host ""
    }

    Write-Host "Choose a root manager:"
    Write-Host "1 - MAGISK"
    Write-Host "2 - KERNELSU"
    Write-Host "3 - APATCH"

    $rootapp = Read-Host "Select an option"

    switch ($rootapp) {

        "1" {
            adb install "dependencies/rootmanager/magisk.apk"
        }

        "2" {
            adb install "dependencies/rootmanager/kernelsu.apk"
        }

        "3" {
            adb install "dependencies/rootmanager/apatch.apk"
        }

        default {
            Write-Host "❌ Invalid option selected."
        }
    }
}


function menu() {

    Write-Host ""
    Write-Host "╔══════════════════════════════════════════════════════╗"
    Write-Host "║                 OneClickRoot by FHM                 ║"
    Write-Host "╠══════════════════════════════════════════════════════╣"
    Write-Host "║ 1. 🔓 Unlock Bootloader                             ║"
    Write-Host "║    ⚠️  Erases all user data                         ║"
    Write-Host "║                                                      ║"
    Write-Host "║ 2. 📦 Root Existing Unlocked Device                 ║"
    Write-Host "║    └─ Magisk / KernelSU / APatch                    ║"
    Write-Host "║                                                      ║"
    Write-Host "║ 3. 🚀 Unlock Bootloader + Root (Recommended)        ║"
    Write-Host "║                                                      ║"
    Write-Host "║ 4. 🗑️  Remove Root                                  ║"
    Write-Host "║                                                      ║"
    Write-Host "║ 5. 🗑️  TWRP PERSONALBUILD INSTALL {COMING SOON}    ║"
    Write-Host "║                                                      ║"
    Write-Host "║ 0. ❌ Reboot and Install Rootmanagers                ║"
    Write-Host "╚══════════════════════════════════════════════════════╝"

    $choice = Read-Host "Select an option [0-3]"

    switch ($choice) {

        "1" {
            bootloaderunlock
        }

        "2" {
            rootselection
        }

        "3" {
            oneclickroot
        }

        "4" {

            fastboot -s $serial flash init_boot_a "dependencies/lavaplayultra/rootmethods/init_boot.img"
            fastboot -s $serial flash init_boot_b "dependencies/lavaplayultra/rootmethods/init_boot.img"
            fastboot -s $serial flash boot_a "dependencies/lavaplayultra/rootmethods/boot.img"
            fastboot -s $serial flash boot_b "dependencies/lavaplayultra/rootmethods/boot.img"

            Write-Host "root removed completely"

            menu
        }

        "0" {

            fastboot -s $serial reboot

            install_root_managers

            exit 0
        }

        default {
            Write-Host "Invalid option."
            menu
        }
    }
}


Write-Host "========================================"
Write-Host "         OneClickRoot by FHM"
Write-Host "========================================"
Write-Host ""

$device = adb devices | Select-String "\sdevice$"
$count = @($device).Count


if ($count -eq 1) {

    Write-Host "Device Connected"
    Write-Host $device

    Write-Host "╔══════════════════════════════════════╗"
    Write-Host "║      📱 Connected Device Info        ║"
    Write-Host "╚══════════════════════════════════════╝"

    $deviceModel = (adb shell getprop ro.product.model).Trim()
    $android = (adb shell getprop ro.build.version.release).Trim()

    Write-Host "$deviceModel"
    Write-Host "Android Version: $android"

    adb -s $serial reboot bootloader

    Write-Host ""
    Write-Host "⏳ Waiting for the device to reboot into Fastboot mode..."

    while (-not (fastboot devices | Select-String "fastboot")) {
        Start-Sleep -Seconds 1
    }

    fastboot devices

    menu
}

elseif ($count -eq 0) {

    Write-Host ""
    Write-Host "══════════════════════════════════════════════════════"
    Write-Host "❌ No ADB device detected."
    Write-Host ""
    Write-Host "Please verify the following before trying again:"
    Write-Host "  • Connect the device using a USB cable."
    Write-Host "  • Enable USB Debugging in Developer Options."
    Write-Host "  • Allow the USB debugging authorization prompt."
    Write-Host "  • Keep the device unlocked on the Home screen."
    Write-Host "══════════════════════════════════════════════════════"
}

else {

    Write-Host "Kindly remove all other devices for safe rooting."
}
```

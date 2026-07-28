#!bin/bash
progrs=0
serial=$(adb devices | awk '$2=="device"{print $1;exit}')


function bootloaderunlock() {
   printf "\n"
printf "══════════════════════════════════════════════════════\n"
printf "🔓 Bootloader Unlock\n\n"
printf "A confirmation screen should now be visible on your device.\n"
printf "Use the Volume buttons to select 'Unlock the bootloader',\n"
printf "then press the Power button to confirm.\n"
printf "⚠️  This will erase all data on your device.\n"
printf "══════════════════════════════════════════════════════\n"
sleep 5
fastboot -s "$serial" flashing unlock
read -rp "Proceed only after you have confirmed the bootloader unlock on your device (Volume Up). Enter 1 to continue, or Enter 0 to cancel: " CONFIRM
if [ "$CONFIRM" -eq 1 ]; then
fastboot -s "$serial" --disable-verity --disable-verification flash vbmeta "dependencies/lavaplayultra/vbmeta/vbmeta.img"
echo "Bootloader unlocked successfully"
else
menu
fi


}
function  rootselection() {

    printf "══════════════════════════════════════════════\n"
    printf "             Root Framework Selection\n"
    printf "══════════════════════════════════════════════\n"
    printf "1. Magisk (Recommended)\n"
    printf "2. KernelSU\n"
    printf "3. APatch\n"
     printf "4. Remove Root Completely\n"
    printf "0. Cancel\n"
    printf "══════════════════════════════════════════════\n"

    read -rp "Select an option: " root_choice

    case "$root_choice" in
        1)  
            fastboot -s "$serial" --disable-verity --disable-verification flash vbmeta "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            fastboot -s "$serial" flash init_boot_a "dependencies/lavaplayultra/rootmethods/magisk_20251111.img"
            fastboot -s "$serial" flash init_boot_b "dependencies/lavaplayultra/rootmethods/magisk_20251111.img"
            menu
            ;;
        2)
            fastboot -s "$serial" --disable-verity --disable-verification flash vbmeta "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            fastboot -s "$serial" flash init_boot_a "dependencies/lavaplayultra/rootmethods/kernelsu_init.img"
            fastboot -s "$serial" flash init_boot_b "dependencies/lavaplayultra/rootmethods/kernelsu_init.img"
            menu
            ;;
        3)
            echo "cooming soon"
            rootselection
            ;;
        4)
            fastboot -s "$serial" flash init_boot_a "dependencies/lavaplayultra/rootmethods/init_boot.img"
            fastboot -s "$serial" flash init_boot_b "dependencies/lavaplayultra/rootmethods/init_boot.img"
            fastboot -s "$serial" flash vbmeta_a "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            fastboot -s "$serial" flash vbmeta_b "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            echo "root removed completely"
            menu
            ;;
        0)
            printf "Operation cancelled.\n"
            menu
            ;;
        *)
            printf "❌ Invalid selection.\n"
            rootselection
            ;;
    esac
}
function oneclickroot() {
echo "⚡ Automatically unlocks the bootloader, then allows you to select your preferred root framework (Magisk, KernelSU, or APatch)."
bootloaderunlock
printf "══════════════════════════════════════════════════════\n"
printf "Created by Fahim (@fahimfrk_)\n\n"
printf "⭐ If you found this tool helpful, consider giving it a GitHub star.\n"
printf "Your support helps improve the project.\n\n"
printf "Feel free to use, modify, and contribute to this script.\n"
printf "Let's add support for even more devices together!\n"
printf "══════════════════════════════════════════════════════\n"
rootselection
printf "🎉 Root completed successfully!\n\n"

}


function menu() {
printf "\n"
printf "╔══════════════════════════════════════════════════════╗\n"
printf "║                 OneClickRoot by FHM                 ║\n"
printf "╠══════════════════════════════════════════════════════╣\n"
printf "║ 1. 🔓 Unlock Bootloader                             ║\n"
printf "║    ⚠️  Erases all user data                         ║\n"
printf "║                                                      ║\n"
printf "║ 2. 📦 Root Existing Unlocked Device                 ║\n"
printf "║    └─ Magisk / KernelSU / APatch                    ║\n"
printf "║                                                      ║\n"
printf "║ 3. 🚀 Unlock Bootloader + Root (Recommended)        ║\n"
printf "║                                                      ║\n"
printf "║ 4. 🗑️  Remove Root                                  ║\n"
printf "║                                                      ║\n"
printf "║ 0. ❌ Exit                                          ║\n"
printf "╚══════════════════════════════════════════════════════╝\n"
read -rp "Select an option [0-3]: " choice

case "$choice" in
    1)
        bootloaderunlock
        ;;
    2)
        rootselection
        ;;
    3)
        oneclickroot
        ;;
    4)
            fastboot -s "$serial" flash init_boot_a "dependencies/lavaplayultra/rootmethods/init_boot.img"
            fastboot -s "$serial" flash init_boot_b "dependencies/lavaplayultra/rootmethods/init_boot.img"
            fastboot -s "$serial" flash vbmeta_a "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            fastboot -s "$serial" flash vbmeta_b "dependencies/lavaplayultra/vbmeta/vbmeta.img"
            echo "root removed completely"
            menu
        ;;
    0)
        fastboot -s "$serial" reboot
        exit 0
        ;;
    *)
        echo "Invalid option."
        menu
        ;;
esac



}


echo "========================================"
echo "         OneClickRoot by FHM"
echo -e "========================================\n"
device=$(adb devices | tail -n +2 | grep -w "device")
count=$(echo "$device" |grep -w "device"| wc -l)
if [ "$count" -eq 1 ]; then
echo -e  "Device Connected \n $device\n"
echo "╔══════════════════════════════════════╗"
echo "║      📱 Connected Device Info        ║"
echo "╚══════════════════════════════════════╝"

device=$(adb shell getprop ro.product.model)
android=$(adb shell getprop ro.build.version.release)
echo -e "$device \nAndroid Version: $android"
adb -s "$serial" reboot bootloader
printf "\n"
printf "⏳ Waiting for the device to reboot into Fastboot mode...\n"
while ! fastboot devices | grep -q fastboot; do
sleep 1
done
fastboot devices
menu

elif [ "$count" -eq 0 ]; then
printf "\n"
printf "══════════════════════════════════════════════════════\n"
printf "❌ No ADB device detected.\n\n"
printf "Please verify the following before trying again:\n"
printf "  • Connect the device using a USB cable.\n"
printf "  • Enable USB Debugging in Developer Options.\n"
printf "  • Allow the USB debugging authorization prompt.\n"
printf "  • Keep the device unlocked on the Home screen.\n"
printf "══════════════════════════════════════════════════════\n"
else
echo -e "Kindly remove all other devices for safe rooting. \n "
fi

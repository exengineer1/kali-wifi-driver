#!/bin/bash


clear 
echo "##############################################################"
echo " __________                          .___                     "
echo " \______   \_______  _________     __| _/____  ____   _____   "
echo "  |    |  _/\_  __ \/  _ \__  \   / __ |/ ___\/  _ \ /     \  "
echo "  |    |   \ |  | \(  <_> ) __ \_/ /_/ \  \__(  <_> )  Y Y  \ "
echo "  |______  / |__|   \____(____  /\____ |\___  >____/|__|_|  / "
echo "         \/                   \/      \/    \/            \/  "
echo "                                                              "
echo "##############################################################"
sleep 2

PS3='Please select your choice: '
options=("Install Wifi Driver" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Wifi Driver")
            echo "After Installation Compleate Your Machine Will Reboot"
            apt-get update
apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
modprobe wl
reboot
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

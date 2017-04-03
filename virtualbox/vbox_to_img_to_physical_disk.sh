#!/usr/bin/env bash
#Author:    Jordan Ulmer
#Date:      2017-04-03
#Purpose:   Export VBOX as IMG - Copy Image to Flashdrive

# Windows - Export VBOX to IMG
# C:\Users\jdulmer\VirtualBox VMs\HIPE-Workspace-CAEUSER-Ubuntu-12.04>"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" internalcommands converttoraw .\20161222-HIPE-Workspace-CAEUSER-Ubuntu-12.04-disk1.vmdk .\2017-03-08-HIPE-CAEUSER-Ubuntu-12.04-disk.img

# Linux - Write IMG to Flashdrive
sudo dd bs=4M if=/media/TI10667700F/Users/jdulmer/Downloads/2017-03-08-HIPE-CAEUSER-Ubuntu-12.04-disk.img of=/dev/sdd

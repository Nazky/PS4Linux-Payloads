# PS4Linux-Payloads
### Linux payload for PS4
#### 5.05 - 9.00

------------

## Why this repo ?
I just wanted to keep all PS4-kexec with fix in the same place, also i wanted to build payloads do separate folders.

## PS4-kexec is the payload ?
NO, the kexec here is for boot a custom kernel, the payload (main.c) here is for boot the os and kernel by using the kexec.

You can find a better explanation [here](https://en.wikipedia.org/wiki/Kexec)

## How i compile the payload ?

You need some dependance, you can install them with these command.

### Ubuntu/Debian
```bash
sudo apt install build-essential
sudo apt install yasm
```

### Arc Linux
```bash
sudo pacman -Sy base-devel
sudo pacman -Sy yasm
```
After that just go to the root directory and run the **make** command.

## How can i run/install linux ?
You can install and run linux by using a usb device or directly with the hdd (i am not going to show how install gentoo here !), disable the HDR and set the ps4 resolution to 1080p. 

If you want to use my host (http://ps4xploit.zd.lu) here is how you can run the linux payload on 9.00 for now.

1) Jailbreak with goldhen (just click on the big jailbreak button).
2) Enable the binloader in the PS4 settings.
3) Go to the host and select a payload ('Disbale Update' or 'Disbale ASLR' for exemple).
4) Choose a linux payload.

___

USE THE RIGHT KERNEL FOR YOU'R PS4 !!

| PS4         | Kernel     |
|--------------|-----------|
| Aeolia | [**4.14.93**](https://mega.nz/file/EJhBzTIQ#rpbOcpIpulojUxRUiZjLQ7RqS6tlNc6JmcCrgSxyG-g) [**5.3.18** (BETA)](https://github.com/ps4boot/ps4-linux/releases/download/v1/bzImageAeolia)|
| Beliz | [**4.14.93**](https://github.com/Nazky/ps4-linux/releases/download/4.19.93-belize/bzImage) [**5.3.18** (BETA)](https://github.com/ps4boot/ps4-linux/releases/download/v1/bzImage) |
| Baikal | [**4.14.93**](https://mega.nz/file/4FhBjbaS#zgy2TFTPN1fdWLyLZaJJBfIv2cZQOExdXvfYRVqIHNU) [**5.3.18** (BETA)](https://github.com/ps4boot/ps4-linux/releases/download/v1/bzImageBaikal)  |

___

### Install in a USB storage device :
It's recommended to use a usb 3.0 here, put the psxitarch.tar.xz (you can use any other os like fedora or manjaro just rename it 'psxitarch.tar.xz'), the bzimage and the initramfs.cpio.gz in the root of the usb device.
Download this [**initramfs.cpio.gz**](https://github.com/hippie68/psxitarch-how-to/releases/download/v1.00/initramfs.cpio.gz) (Credit to [**@hippie68**](https://github.com/hippie68)).

1) Format the USB storage device to FAT32.
2) Go to the host you like (or use one of the aleardy compiled payload) and use the **"Linux 1GB"**.
3) When the CLI is booting use this command ```exec install-psxitarch.sh```.
5) Wait.
6) After the installation is done use the command ```resume-boot``` (You can now use the linux 3 or 4 GB and use ```resume-boot``` to boot to the OS).

### Install in the internal HDD :
Put the arch.tar.xz (you can use any other os like fedora or manjaro just rename it 'arch.tar.xz'), the bzimage and the initramfs.cpio.gz in /user/system/boot.
Download this [**initramfs.cpio.gz**](https://mega.nz/file/g0J3USrD#qRQhmJXUaAD0lz4N6HlER6OlLjVlXDWF99WRI1auV94).

1) Format a usb device to FAT32 and put this [**file**](https://mega.nz/file/phZ13ShL#YZKkKhFrmkrVmRpIrjc8EnrvDr5iuEEn4xXXtRh4Jo0) in the root
2) Go to the host you like disconnect all usb device insert the one with the file in it and use the linux you want.
3) When the CLI is booting run these commands ```mkdir usb``` then ```mount /dev/sdb1 /usb``` then ```./usb/Install-HDD.sh```.
4) Choose how many GB you want for the linux OS (minimum 50GB).
5) After the installation is done use CTRL + D twice and wait.
6) Congrat the OS is booting now (you can use any linux payload now the linux OS is going to boot automaticly)

(YOU NEED A PS4 WITH A KERNEL THAT SUPPORT THE HDD FOR DOING THAT, IF YOU HAVE A ERROR ```Can't mount /dev/mapper/ps4hdd``` THAT'S MEAN YOU'R PS4 IS NOT COMPATIBLE)

### Unistall linux :
For unistalling linux it's pretty simple you just have to format you'r USB storage device or delete the linux.img in /system/home

## I have a error

you can leave a issue or contact me on twitter.

#### Credit
[@sleirsgoevy](https://github.com/sleirsgoevy/ "@sleirsgoevy") for the payload, [@tihmstar](https://github.com/tihmstar "@tihmstar") for 7.02 offset, [@codedwrench](https://github.com/codedwrench "@codedwrench") for 7.55 & 9.00 offset

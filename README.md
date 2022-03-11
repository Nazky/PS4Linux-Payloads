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
Follow [this guide](https://github.com/Hakkuraifu/PS4Linux-Documentation)

#### Credit
[@sleirsgoevy](https://github.com/sleirsgoevy/ "@sleirsgoevy") for the payload, [@tihmstar](https://github.com/tihmstar "@tihmstar") for 7.02 offset, [@codedwrench](https://github.com/codedwrench "@codedwrench") for 7.55 & 9.00 offset

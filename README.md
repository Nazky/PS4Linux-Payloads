# PS4Linux-Payloads
### Linux payload for PS4
#### 6.72 - 7.55

------------

## Why this repo ?
I just wanted to keep all PS4-kexec with fix in the same place, also i wanted to build payloads do separate folders.

## PS4-kexec is the payload ?
NO, the kexec here is for boot a custom kernel the payload (main.c) here is for boot the os and kernel by using the kexec.

You can find a better explanation [here](https://en.wikipedia.org/wiki/Kexec "here")

## How i compile the payload ?

You need some dependance, you can isntall them with these command.

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
After that just go to the root directory and run the **make** command

## Can i download just the kexec ?

YES

(if you have a alert just ignore it)

| PS4-kexec  | Link  |
| ------------ | ------------ |
| 6.72  | [Download](https://bit.ly/3enLFd6 "Download")  |
| 7.02  | [Download](https://bit.ly/3xisBFC "Download")  |
| 7.55  | [Download](https://bit.ly/3aRszev "Download")  |

## I have a error when i try to compile the payload

you can leave a issue or contact me on twitter

#### Credit
[@sleirsgoevy](https://github.com/sleirsgoevy/ "@sleirsgoevy") for the payload, [@tihmstar](https://github.com/tihmstar "@tihmstar") for 7.02 offset, [@codedwrench](https://github.com/codedwrench "@codedwrench") for 7.55 offset

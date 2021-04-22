all: payload-672.elf payload-672.bin payload-672-3gb.elf payload-672-3gb.bin payload-702.elf payload-702-3gb.elf payload-702.bin payload-702-3gb.bin payload-755.elf payload-755.bin payload-755-3gb.elf payload-755-3gb.bin

clean:
	rm -rf 672 702 755
	cd lib; make clean
	cd ps4-kexec; make clean
	cd ps4-kexec-702; make clean
	cd ps4-kexec-755; make clean


lib/lib.a:
	cd lib; make

payload-672.elf: lib/lib.a main.c ps4-kexec/kexec.bin
	mkdir 672
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a main.c -Wl,-gc-sections -o 672/payload-672.elf

payload-672.bin: payload-672.elf
	objcopy 672/payload-672.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/payload-672.bin
	file 672/payload-672.bin | fgrep -q 'payload-672.bin: DOS executable (COM)'

payload-702.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	mkdir 702
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_02__ main.c -Wl,-gc-sections -o 702/payload-702.elf

payload-702.bin: payload-702.elf
	objcopy 702/payload-702.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/payload-702.bin
	file 702/payload-702.bin | fgrep -q 'payload-702.bin: DOS executable (COM)'
	
payload-755.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	mkdir 755
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_55__ main.c -Wl,-gc-sections -o 755/payload-755.elf

payload-755.bin: payload-755.elf
	objcopy 755/payload-755.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/payload-755.bin
	file 755/payload-755.bin | fgrep -q 'payload-755.bin: DOS executable (COM)'

payload-672-3gb.elf: lib/lib.a main.c ps4-kexec/kexec.bin
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=3 main.c -Wl,-gc-sections -o 672/payload-672-3gb.elf

payload-672-3gb.bin: payload-672-3gb.elf
	objcopy 672/payload-672-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/payload-672-3gb.bin
	file 672/payload-672-3gb.bin | fgrep -q 'payload-672-3gb.bin: DOS executable (COM)'

payload-702-3gb.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_02__ -DVRAM_GB_DEFAULT=3 main.c -Wl,-gc-sections -o 702/payload-702-3gb.elf

payload-702-3gb.bin: payload-702-3gb.elf
	objcopy 702/payload-702-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/payload-702-3gb.bin
	file 702/payload-702-3gb.bin | fgrep -q 'payload-702-3gb.bin: DOS executable (COM)'
	
payload-755-3gb.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_55__ -DVRAM_GB_DEFAULT=3 main.c -Wl,-gc-sections -o 755/payload-755-3gb.elf
	
payload-755-3gb.bin: payload-755-3gb.elf
	objcopy 755/payload-755-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/payload-755-3gb.bin
	file 755/payload-755-3gb.bin | fgrep -q 'payload-755-3gb.bin: DOS executable (COM)'

ps4-kexec-755/kexec.bin:
	cd ps4-kexec-755; make

ps4-kexec-702/kexec.bin:
	cd ps4-kexec-702; make

ps4-kexec/kexec.bin:
	cd ps4-kexec; make

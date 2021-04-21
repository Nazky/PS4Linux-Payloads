all: payload-672.elf payload-672.bin payload-672-4gb.elf payload-672-4gb.bin payload-702.elf payload-702-4gb.elf payload-702.bin payload-702-4gb.bin payload-755.elf payload-755.bin payload-755-4gb.elf payload-755-4gb.bin

clean:
	rm -f payload-672.elf payload-672.bin payload-702.elf payload-702.bin payload-672-4gb.elf payload-672-4gb.bin payload-702-4gb.elf payload-702-4gb.bin payload-755.elf payload-755.bin payload-755-4gb.elf payload-755-4gb.bin
	cd lib; make clean
	cd ps4-kexec; make clean
	cd ps4-kexec-702; make clean
	cd ps4-kexec-755; make clean


lib/lib.a:
	cd lib; make

payload-672.elf: lib/lib.a main.c ps4-kexec/kexec.bin
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a main.c -Wl,-gc-sections -o payload-672.elf

payload-672.bin: payload-672.elf
	objcopy payload-672.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary payload-672.bin
	file payload-672.bin | fgrep -q 'payload-672.bin: DOS executable (COM)'

payload-702.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_02__ main.c -Wl,-gc-sections -o payload-702.elf

payload-702.bin: payload-702.elf
	objcopy payload-702.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary payload-702.bin
	file payload-702.bin | fgrep -q 'payload-702.bin: DOS executable (COM)'
	
payload-755.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_55__ main.c -Wl,-gc-sections -o payload-755.elf

payload-755.bin: payload-755.elf
	objcopy payload-755.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary payload-755.bin
	file payload-755.bin | fgrep -q 'payload-755.bin: DOS executable (COM)'

payload-672-4gb.elf: lib/lib.a main.c ps4-kexec/kexec.bin
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o payload-672-4gb.elf

payload-672-4gb.bin: payload-672-4gb.elf
	objcopy payload-672-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary payload-672-4gb.bin
	file payload-672-4gb.bin | fgrep -q 'payload-672-4gb.bin: DOS executable (COM)'

payload-702-4gb.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_02__ -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o payload-702-4gb.elf

payload-702-4gb.bin: payload-702-4gb.elf
	objcopy payload-702-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary payload-702-4gb.bin
	file payload-702-4gb.bin | fgrep -q 'payload-702-4gb.bin: DOS executable (COM)'
	
payload-755-4gb.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem ps4-rop-8cc/freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_55__ -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o payload-755-4gb.elf
	
payload-755-4gb.bin: payload-755-4gb.elf
	objcopy payload-755-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary payload-755-4gb.bin
	file payload-755-4gb.bin | fgrep -q 'payload-755-4gb.bin: DOS executable (COM)'

ps4-kexec-755/kexec.bin:
	cd ps4-kexec-755; make

ps4-kexec-702/kexec.bin:
	cd ps4-kexec-702; make

ps4-kexec/kexec.bin:
	cd ps4-kexec; make

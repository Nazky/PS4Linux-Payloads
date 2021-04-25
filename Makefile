all: LinuxLoader-672.bin LinuxLoader-672-3gb.bin LinuxLoader-702.bin LinuxLoader-702-3gb.bin LinuxLoader-755.bin LinuxLoader-755-3gb.bin LinuxLoader-672-4gb.bin LinuxLoader-702-4gb.bin LinuxLoader-755-4gb.bin LinuxLoader-672-5gb.bin LinuxLoader-702-5gb.bin LinuxLoader-755-5gb.bin

clean:
	rm -rf 672 702 755
	cd lib; make clean
	cd ps4-kexec-672; make clean
	cd ps4-kexec-702; make clean
	cd ps4-kexec-755; make clean


lib/lib.a:
	clear
	@echo Compiling lib.a
	@echo
	cd lib; make
	@echo
	@echo lib.a compile
	@echo 
	@echo Compiling Payloads
	@echo 

LinuxLoader-672.elf: lib/lib.a main.c ps4-kexec-672/kexec.bin
	mkdir 672
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a main.c -Wl,-gc-sections -o 672/LinuxLoader-672.elf

LinuxLoader-672.bin: LinuxLoader-672.elf
	objcopy 672/LinuxLoader-672.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/LinuxLoader-672.bin
	file 672/LinuxLoader-672.bin | fgrep -q 'LinuxLoader-672.bin: DOS executable (COM)'

LinuxLoader-702.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	mkdir 702
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_02__ main.c -Wl,-gc-sections -o 702/LinuxLoader-702.elf

LinuxLoader-702.bin: LinuxLoader-702.elf
	objcopy 702/LinuxLoader-702.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/LinuxLoader-702.bin
	file 702/LinuxLoader-702.bin | fgrep -q 'LinuxLoader-702.bin: DOS executable (COM)'
	
LinuxLoader-755.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	mkdir 755
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_55__ main.c -Wl,-gc-sections -o 755/LinuxLoader-755.elf

LinuxLoader-755.bin: LinuxLoader-755.elf
	objcopy 755/LinuxLoader-755.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/LinuxLoader-755.bin
	file 755/LinuxLoader-755.bin | fgrep -q 'LinuxLoader-755.bin: DOS executable (COM)'

LinuxLoader-672-3gb.elf: lib/lib.a main.c ps4-kexec-672/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=3 main.c -Wl,-gc-sections -o 672/LinuxLoader-672-3gb.elf

LinuxLoader-672-3gb.bin: LinuxLoader-672-3gb.elf
	objcopy 672/LinuxLoader-672-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/LinuxLoader-672-3gb.bin
	file 672/LinuxLoader-672-3gb.bin | fgrep -q 'LinuxLoader-672-3gb.bin: DOS executable (COM)'

LinuxLoader-702-3gb.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_02__ -DVRAM_GB_DEFAULT=3 main.c -Wl,-gc-sections -o 702/LinuxLoader-702-3gb.elf

LinuxLoader-702-3gb.bin: LinuxLoader-702-3gb.elf
	objcopy 702/LinuxLoader-702-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/LinuxLoader-702-3gb.bin
	file 702/LinuxLoader-702-3gb.bin | fgrep -q 'LinuxLoader-702-3gb.bin: DOS executable (COM)'
	
LinuxLoader-755-3gb.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_55__ -DVRAM_GB_DEFAULT=3 main.c -Wl,-gc-sections -o 755/LinuxLoader-755-3gb.elf
	
LinuxLoader-755-3gb.bin: LinuxLoader-755-3gb.elf
	objcopy 755/LinuxLoader-755-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/LinuxLoader-755-3gb.bin
	file 755/LinuxLoader-755-3gb.bin | fgrep -q 'LinuxLoader-755-3gb.bin: DOS executable (COM)'

LinuxLoader-672-4gb.elf: lib/lib.a main.c ps4-kexec-672/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o 672/LinuxLoader-672-4gb.elf

LinuxLoader-672-4gb.bin: LinuxLoader-672-4gb.elf
	objcopy 672/LinuxLoader-672-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/LinuxLoader-672-4gb.bin
	file 672/LinuxLoader-672-4gb.bin | fgrep -q 'LinuxLoader-672-4gb.bin: DOS executable (COM)'

LinuxLoader-702-4gb.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_02__ -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o 702/LinuxLoader-702-4gb.elf

LinuxLoader-702-4gb.bin: LinuxLoader-702-4gb.elf
	objcopy 702/LinuxLoader-702-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/LinuxLoader-702-4gb.bin
	file 702/LinuxLoader-702-4gb.bin | fgrep -q 'LinuxLoader-702-4gb.bin: DOS executable (COM)'
	
LinuxLoader-755-4gb.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_55__ -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o 755/LinuxLoader-755-4gb.elf
	
LinuxLoader-755-4gb.bin: LinuxLoader-755-4gb.elf
	objcopy 755/LinuxLoader-755-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/LinuxLoader-755-4gb.bin
	file 755/LinuxLoader-755-4gb.bin | fgrep -q 'LinuxLoader-755-4gb.bin: DOS executable (COM)'

LinuxLoader-672-5gb.elf: lib/lib.a main.c ps4-kexec-672/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o 672/LinuxLoader-672-5gb.elf

LinuxLoader-672-5gb.bin: LinuxLoader-672-5gb.elf
	objcopy 672/LinuxLoader-672-5gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/LinuxLoader-672-5gb.bin
	file 672/LinuxLoader-672-5gb.bin | fgrep -q 'LinuxLoader-672-5gb.bin: DOS executable (COM)'

LinuxLoader-702-5gb.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_02__ -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o 702/LinuxLoader-702-5gb.elf

LinuxLoader-702-5gb.bin: LinuxLoader-702-5gb.elf
	objcopy 702/LinuxLoader-702-5gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/LinuxLoader-702-5gb.bin
	file 702/LinuxLoader-702-5gb.bin | fgrep -q 'LinuxLoader-702-5gb.bin: DOS executable (COM)'
	
LinuxLoader-755-5gb.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_55__ -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o 755/LinuxLoader-755-5gb.elf
	
LinuxLoader-755-5gb.bin: LinuxLoader-755-5gb.elf
	objcopy 755/LinuxLoader-755-5gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/LinuxLoader-755-5gb.bin
	file 755/LinuxLoader-755-5gb.bin | fgrep -q 'LinuxLoader-755-5gb.bin: DOS executable (COM)'

ps4-kexec-672/kexec.bin:
	cd ps4-kexec-672; make

ps4-kexec-702/kexec.bin:
	cd ps4-kexec-702; make

ps4-kexec-755/kexec.bin:
	cd ps4-kexec-755; make


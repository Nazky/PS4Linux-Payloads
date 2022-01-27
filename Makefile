all: CreateDir 505 672 702 755 900

clean:
	rm -rf 505 672 702 755 900
	cd lib; make clean
	cd ps4-kexec-505; make clean
	cd ps4-kexec-672; make clean
	cd ps4-kexec-702; make clean
	cd ps4-kexec-755; make clean
	cd ps4-kexec-900; make clean

cleanelf505: 
	cd 505; rm *.elf

cleanelf672:
	cd 672; rm *.elf

cleanelf702:
	cd 702; rm *.elf

cleanelf755:
	cd 755; rm *.elf

cleanelf900:
	cd 900; rm *.elf

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

505: LinuxLoader-720-505.bin LinuxLoader-720-505-2gb.bin LinuxLoader-720-505-3gb.bin LinuxLoader-720-505-4gb.bin LinuxLoader-720-505-5gb.bin cleanelf505

672: LinuxLoader-720-672.bin LinuxLoader-720-672-2gb.bin LinuxLoader-720-672-3gb.bin LinuxLoader-720-672-4gb.bin LinuxLoader-720-672-5gb.bin cleanelf672

702: LinuxLoader-720-702.bin LinuxLoader-720-702-2gb.bin LinuxLoader-720-702-3gb.bin LinuxLoader-720-702-4gb.bin LinuxLoader-720-702-5gb.bin cleanelf702

755: LinuxLoader-720-755.bin LinuxLoader-720-755-2gb.bin LinuxLoader-720-755-3gb.bin LinuxLoader-720-755-4gb.bin LinuxLoader-720-755-5gb.bin cleanelf755

900: LinuxLoader-720-900.bin LinuxLoader-720-900-2gb.bin LinuxLoader-720-900-3gb.bin LinuxLoader-720-900-4gb.bin LinuxLoader-720-900-5gb.bin cleanelf900

CreateDir:
	mkdir 505
	mkdir 672
	mkdir 702
	mkdir 755
	mkdir 900

#720p

LinuxLoader-720-505.elf: lib/lib.a main.c ps4-kexec-505/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__5_05__ main.c -Wl,-gc-sections -o 505/LinuxLoader-720-505.elf -fPIE -ffreestanding
 
LinuxLoader-720-505.bin: LinuxLoader-720-505.elf
	objcopy 505/LinuxLoader-720-505.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 505/LinuxLoader-720-505.bin
	file 505/LinuxLoader-720-505.bin | fgrep -q 'LinuxLoader-720-505.bin: DOS executable (COM)'

LinuxLoader-720-672.elf: lib/lib.a main.c ps4-kexec-672/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__6_72__  main.c -Wl,-gc-sections -o 672/LinuxLoader-720-672.elf -fPIE -ffreestanding

LinuxLoader-720-672.bin: LinuxLoader-720-672.elf
	objcopy 672/LinuxLoader-720-672.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/LinuxLoader-720-672.bin
	file 672/LinuxLoader-720-672.bin | fgrep -q 'LinuxLoader-720-672.bin: DOS executable (COM)'

LinuxLoader-720-702.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_02__ main.c -Wl,-gc-sections -o 702/LinuxLoader-720-702.elf -fPIE -ffreestanding

LinuxLoader-720-702.bin: LinuxLoader-720-702.elf
	objcopy 702/LinuxLoader-720-702.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/LinuxLoader-720-702.bin
	file 702/LinuxLoader-720-702.bin | fgrep -q 'LinuxLoader-720-702.bin: DOS executable (COM)'
	
LinuxLoader-720-755.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__7_55__ main.c -Wl,-gc-sections -o 755/LinuxLoader-720-755.elf -fPIE -ffreestanding

LinuxLoader-720-755.bin: LinuxLoader-720-755.elf
	objcopy 755/LinuxLoader-720-755.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/LinuxLoader-720-755.bin
	file 755/LinuxLoader-720-755.bin | fgrep -q 'LinuxLoader-720-755.bin: DOS executable (COM)'

LinuxLoader-720-900.elf: lib/lib.a main.c ps4-kexec-900/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__9_00__ main.c -Wl,-gc-sections -o 900/LinuxLoader-720-900.elf -fPIE -ffreestanding

LinuxLoader-720-900.bin: LinuxLoader-720-900.elf
	objcopy 900/LinuxLoader-720-900.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 900/LinuxLoader-720-900.bin
	file 900/LinuxLoader-720-900.bin | fgrep -q 'LinuxLoader-720-900.bin: DOS executable (COM)'

LinuxLoader-720-505-2gb.elf: lib/lib.a main.c ps4-kexec-505/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=2 -D__5_05__ main.c -Wl,-gc-sections -o 505/LinuxLoader-720-505-2gb.elf -fPIE -ffreestanding

LinuxLoader-720-505-2gb.bin: LinuxLoader-720-505-2gb.elf
	objcopy 505/LinuxLoader-720-505-2gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 505/LinuxLoader-720-505-2gb.bin
	file 505/LinuxLoader-720-505-2gb.bin | fgrep -q 'LinuxLoader-720-505-2gb.bin: DOS executable (COM)'

LinuxLoader-720-672-2gb.elf: lib/lib.a main.c ps4-kexec-672/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__6_72__ -DVRAM_GB_DEFAULT=2 main.c -Wl,-gc-sections -o 672/LinuxLoader-720-672-2gb.elf -fPIE -ffreestanding

LinuxLoader-720-672-2gb.bin: LinuxLoader-720-672-2gb.elf
	objcopy 672/LinuxLoader-720-672-2gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/LinuxLoader-720-672-2gb.bin
	file 672/LinuxLoader-720-672-2gb.bin | fgrep -q 'LinuxLoader-720-672-2gb.bin: DOS executable (COM)'

LinuxLoader-720-702-2gb.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=2 -D__7_02__ main.c -Wl,-gc-sections -o 702/LinuxLoader-720-702-2gb.elf -fPIE -ffreestanding

LinuxLoader-720-702-2gb.bin: LinuxLoader-720-702-2gb.elf
	objcopy 702/LinuxLoader-720-702-2gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/LinuxLoader-720-702-2gb.bin
	file 702/LinuxLoader-720-702-2gb.bin | fgrep -q 'LinuxLoader-720-702-2gb.bin: DOS executable (COM)'
	
LinuxLoader-720-755-2gb.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=2 -D__7_55__ main.c -Wl,-gc-sections -o 755/LinuxLoader-720-755-2gb.elf -fPIE -ffreestanding
	
LinuxLoader-720-755-2gb.bin: LinuxLoader-720-755-2gb.elf
	objcopy 755/LinuxLoader-720-755-2gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/LinuxLoader-720-755-2gb.bin
	file 755/LinuxLoader-720-755-2gb.bin | fgrep -q 'LinuxLoader-720-755-2gb.bin: DOS executable (COM)'

LinuxLoader-720-900-2gb.elf: lib/lib.a main.c ps4-kexec-900/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=2 -D__9_00__ main.c -Wl,-gc-sections -o 900/LinuxLoader-720-900-2gb.elf -fPIE -ffreestanding
	
LinuxLoader-720-900-2gb.bin: LinuxLoader-720-900-2gb.elf
	objcopy 900/LinuxLoader-720-900-2gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 900/LinuxLoader-720-900-2gb.bin
	file 900/LinuxLoader-720-900-2gb.bin | fgrep -q 'LinuxLoader-720-900-2gb.bin: DOS executable (COM)'

LinuxLoader-720-505-3gb.elf: lib/lib.a main.c ps4-kexec-505/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=3 -D__5_05__ main.c -Wl,-gc-sections -o 505/LinuxLoader-720-505-3gb.elf -fPIE -ffreestanding

LinuxLoader-720-505-3gb.bin: LinuxLoader-720-505-3gb.elf
	objcopy 505/LinuxLoader-720-505-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 505/LinuxLoader-720-505-3gb.bin
	file 505/LinuxLoader-720-505-3gb.bin | fgrep -q 'LinuxLoader-720-505-3gb.bin: DOS executable (COM)'

LinuxLoader-720-672-3gb.elf: lib/lib.a main.c ps4-kexec-672/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__6_72__ -DVRAM_GB_DEFAULT=3 main.c -Wl,-gc-sections -o 672/LinuxLoader-720-672-3gb.elf -fPIE -ffreestanding

LinuxLoader-720-672-3gb.bin: LinuxLoader-720-672-3gb.elf
	objcopy 672/LinuxLoader-720-672-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/LinuxLoader-720-672-3gb.bin
	file 672/LinuxLoader-720-672-3gb.bin | fgrep -q 'LinuxLoader-720-672-3gb.bin: DOS executable (COM)'

LinuxLoader-720-702-3gb.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=3 -D__7_02__ main.c -Wl,-gc-sections -o 702/LinuxLoader-720-702-3gb.elf -fPIE -ffreestanding

LinuxLoader-720-702-3gb.bin: LinuxLoader-720-702-3gb.elf
	objcopy 702/LinuxLoader-720-702-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/LinuxLoader-720-702-3gb.bin
	file 702/LinuxLoader-720-702-3gb.bin | fgrep -q 'LinuxLoader-720-702-3gb.bin: DOS executable (COM)'
	
LinuxLoader-720-755-3gb.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=3 -D__7_55__ main.c -Wl,-gc-sections -o 755/LinuxLoader-720-755-3gb.elf -fPIE -ffreestanding
	
LinuxLoader-720-755-3gb.bin: LinuxLoader-720-755-3gb.elf
	objcopy 755/LinuxLoader-720-755-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/LinuxLoader-720-755-3gb.bin
	file 755/LinuxLoader-720-755-3gb.bin | fgrep -q 'LinuxLoader-720-755-3gb.bin: DOS executable (COM)'

LinuxLoader-720-900-3gb.elf: lib/lib.a main.c ps4-kexec-900/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=3 -D__9_00__ main.c -Wl,-gc-sections -o 900/LinuxLoader-720-900-3gb.elf -fPIE -ffreestanding
	
LinuxLoader-720-900-3gb.bin: LinuxLoader-720-900-3gb.elf
	objcopy 900/LinuxLoader-720-900-3gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 900/LinuxLoader-720-900-3gb.bin
	file 900/LinuxLoader-720-900-3gb.bin | fgrep -q 'LinuxLoader-720-900-3gb.bin: DOS executable (COM)'

LinuxLoader-720-505-4gb.elf: lib/lib.a main.c ps4-kexec-505/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__5_05__ -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o 505/LinuxLoader-720-505-4gb.elf -fPIE -ffreestanding

LinuxLoader-720-505-4gb.bin: LinuxLoader-720-505-4gb.elf
	objcopy 505/LinuxLoader-720-505-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 505/LinuxLoader-720-505-4gb.bin
	file 505/LinuxLoader-720-505-4gb.bin | fgrep -q 'LinuxLoader-720-505-4gb.bin: DOS executable (COM)'

LinuxLoader-720-672-4gb.elf: lib/lib.a main.c ps4-kexec-672/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__6_72__ -DVRAM_GB_DEFAULT=4 main.c -Wl,-gc-sections -o 672/LinuxLoader-720-672-4gb.elf -fPIE -ffreestanding

LinuxLoader-720-672-4gb.bin: LinuxLoader-720-672-4gb.elf
	objcopy 672/LinuxLoader-720-672-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/LinuxLoader-720-672-4gb.bin
	file 672/LinuxLoader-720-672-4gb.bin | fgrep -q 'LinuxLoader-720-672-4gb.bin: DOS executable (COM)'

LinuxLoader-720-702-4gb.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=4 -D__7_02__ main.c -Wl,-gc-sections -o 702/LinuxLoader-720-702-4gb.elf -fPIE -ffreestanding

LinuxLoader-720-702-4gb.bin: LinuxLoader-720-702-4gb.elf
	objcopy 702/LinuxLoader-720-702-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/LinuxLoader-720-702-4gb.bin
	file 702/LinuxLoader-720-702-4gb.bin | fgrep -q 'LinuxLoader-720-702-4gb.bin: DOS executable (COM)'
	
LinuxLoader-720-755-4gb.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=4 -D__7_55__ main.c -Wl,-gc-sections -o 755/LinuxLoader-720-755-4gb.elf -fPIE -ffreestanding
	
LinuxLoader-720-755-4gb.bin: LinuxLoader-720-755-4gb.elf
	objcopy 755/LinuxLoader-720-755-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/LinuxLoader-720-755-4gb.bin
	file 755/LinuxLoader-720-755-4gb.bin | fgrep -q 'LinuxLoader-720-755-4gb.bin: DOS executable (COM)'

LinuxLoader-720-900-4gb.elf: lib/lib.a main.c ps4-kexec-900/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=4 -D__9_00__ main.c -Wl,-gc-sections -o 900/LinuxLoader-720-900-4gb.elf -fPIE -ffreestanding
	
LinuxLoader-720-900-4gb.bin: LinuxLoader-720-900-4gb.elf
	objcopy 900/LinuxLoader-720-900-4gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 900/LinuxLoader-720-900-4gb.bin
	file 900/LinuxLoader-720-900-4gb.bin | fgrep -q 'LinuxLoader-720-900-4gb.bin: DOS executable (COM)'

LinuxLoader-720-505-5gb.elf: lib/lib.a main.c ps4-kexec-505/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=5 -D__5_05__ main.c -Wl,-gc-sections -o 505/LinuxLoader-720-505-5gb.elf -fPIE -ffreestanding

LinuxLoader-720-505-5gb.bin: LinuxLoader-720-505-5gb.elf
	objcopy 505/LinuxLoader-720-505-5gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 505/LinuxLoader-720-505-5gb.bin
	file 505/LinuxLoader-720-505-5gb.bin | fgrep -q 'LinuxLoader-720-505-5gb.bin: DOS executable (COM)'

LinuxLoader-720-672-5gb.elf: lib/lib.a main.c ps4-kexec-672/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -D__6_72__ -DVRAM_GB_DEFAULT=5 main.c -Wl,-gc-sections -o 672/LinuxLoader-720-672-5gb.elf -fPIE -ffreestanding

LinuxLoader-720-672-5gb.bin: LinuxLoader-720-672-5gb.elf
	objcopy 672/LinuxLoader-720-672-5gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 672/LinuxLoader-720-672-5gb.bin
	file 672/LinuxLoader-720-672-5gb.bin | fgrep -q 'LinuxLoader-720-672-5gb.bin: DOS executable (COM)'

LinuxLoader-720-702-5gb.elf: lib/lib.a main.c ps4-kexec-702/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=5 -D__7_02__ main.c -Wl,-gc-sections -o 702/LinuxLoader-720-702-5gb.elf -fPIE -ffreestanding

LinuxLoader-720-702-5gb.bin: LinuxLoader-720-702-5gb.elf
	objcopy 702/LinuxLoader-720-702-5gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 702/LinuxLoader-720-702-5gb.bin
	file 702/LinuxLoader-720-702-5gb.bin | fgrep -q 'LinuxLoader-720-702-5gb.bin: DOS executable (COM)'
	
LinuxLoader-720-755-5gb.elf: lib/lib.a main.c ps4-kexec-755/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=5 -D__7_55__ main.c -Wl,-gc-sections -o 755/LinuxLoader-720-755-5gb.elf -fPIE -ffreestanding
	
LinuxLoader-720-755-5gb.bin: LinuxLoader-720-755-5gb.elf
	objcopy 755/LinuxLoader-720-755-5gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 755/LinuxLoader-720-755-5gb.bin
	file 755/LinuxLoader-720-755-5gb.bin | fgrep -q 'LinuxLoader-720-755-5gb.bin: DOS executable (COM)'

LinuxLoader-720-900-5gb.elf: lib/lib.a main.c ps4-kexec-900/kexec.bin
	gcc -isystem freebsd-headers -nostdinc -nostdlib -fno-stack-protector -static lib/lib.a -DVRAM_GB_DEFAULT=5 -D__9_00__ main.c -Wl,-gc-sections -o 900/LinuxLoader-720-900-5gb.elf -fPIE -ffreestanding
	
LinuxLoader-720-900-5gb.bin: LinuxLoader-720-900-5gb.elf
	objcopy 900/LinuxLoader-720-900-5gb.elf --only-section .text --only-section .data --only-section .bss --only-section .rodata -O binary 900/LinuxLoader-720-900-5gb.bin
	file 900/LinuxLoader-720-900-5gb.bin | fgrep -q 'LinuxLoader-720-900-5gb.bin: DOS executable (COM)'

ps4-kexec-505/kexec.bin:
	cd ps4-kexec-505; make

ps4-kexec-672/kexec.bin:
	cd ps4-kexec-672; make

ps4-kexec-702/kexec.bin:
	cd ps4-kexec-702; make

ps4-kexec-755/kexec.bin:
	cd ps4-kexec-755; make
	
ps4-kexec-900/kexec.bin:
	cd ps4-kexec-900; make

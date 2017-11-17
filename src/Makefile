.PHONY: all


all:	
	nasm -f elf32 start.asm -o start.o
	gcc -Wall -m32 -ffreestanding -nostdlib -nostdinc -c main.c
	ld -T kernel.ld -o kernel.bin start.o main.o
	sudo mount kholeOS.img /mnt/
	sudo rm /mnt/kernel/kernel.bin
	sudo cp kernel.bin /mnt/kernel/
	sudo umount /mnt/
	rm *.o
	qemu-system-i386 -m 512 -drive file=kholeOS.img,index=0,format=raw,media=disk

	

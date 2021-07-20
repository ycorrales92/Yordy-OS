nasm bootloader.asm -f bin -o bootloader.bin
nasm Ext_Program.asm -f elf64 -o ExtProgram.o
x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"
custom-ld -o kernel.tmp -Ttext 0x7e00 ExtProgram.o Kernel.o
objcopy -O binary kernel.tmp kernel.bin
copy /b bootloader.bin+kernel.bin bootloader.flp
pause
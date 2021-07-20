PROGRAM_SPACE equ 0x7e00
BOOT_DISK: db 0
DiskError: db "Error de lectura de disco",0

ReadDisk:
	mov ah, 0x02
	mov bx, PROGRAM_SPACE
	mov al, 32
	mov dl, [BOOT_DISK]
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02
	int 0x13

	jc DiskReadFailed
	
	ret

DiskReadFailed:
	mov bx, DiskError
	call PrintString
	jmp $
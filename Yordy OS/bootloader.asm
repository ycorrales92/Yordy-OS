MSG1: db 'Yordy OS',0

[org 0x7c00]
mov [BOOT_DISK],dl
mov bp, 0x7c00
mov sp, bp

mov bx, MSG1
call PrintString

call ReadDisk

;call PrintString

jmp PROGRAM_SPACE

%include "print.asm"
%include "DiskRead.asm"

times 510-($-$$) db 0
dw 0xaa55

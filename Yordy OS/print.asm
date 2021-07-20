IMPR equ 0x10

PrintString:
	push ax
	push bx
	mov ah, 0x0e
	.Loop:
	cmp [bx], byte 0
	je .Exit
		mov al, [bx]
		int IMPR
		inc bx
		jmp .Loop
	.Exit:
	mov al,0xa
	int IMPR
	mov al,0xd
	int IMPR
	pop ax
	pop bx
	ret
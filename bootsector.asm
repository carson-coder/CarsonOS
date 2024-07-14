; /* vim: set filetype=nasm */
mov ah, 0x0e ; Enter tty mode
mov al, 'H' ; load char
int 0x10   ; Print char

mov al, 'e' ; load char
int 0x10   ; Print char

mov al, 'l' ; load char
int 0x10   ; Print char
int 0x10   ; Print char again

mov al, 'o' ; load char
int 0x10   ; Print char

jmp $ ; loop

; Padding and the magic number
times 510-($-$$) db 0
dw 0xaa55 

[org 0x7c00]
mov ah, 0x0e; tty mode

; init stack
mov bp, 0x8000
mov sp, bp

mov bx, HELLO
call print

call print_nl

mov dx, 0x12fe
call print_hex

call print_nl

mov bx, BYE
call print

jmp $

HELLO:
    db 'Hello, World', 0
BYE:
    db 'Bye', 0

%include "print.asm"

; magic number
times 510-($-$$) db 0
dw 0xaa55

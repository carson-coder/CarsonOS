[org 0x7c00]

main:
    mov ah, 0x0e; tty mode

    ; init stack
    mov bp, 0x8000
    mov sp, bp

    mov bx, 0x9000 ; Put data at 0x9000
    mov dx, 2 ; read 2 sectors

    call disk_load

    mov dx, [0x9000] ; retrieve first loaded word
    call print_hex

    call print_nl

    mov dx, [0x9000 + 512] ; first work from second sector
    call print_hex

jmp $

%include "print.asm"
%include "print.hex.asm"
%include "disk.asm"

; magic number
times 510-($-$$) db 0
dw 0xaa55


; boot sector = sector 1 of cyl 0 of head 0 of hdd 0
; from now on = sector 2 ...
times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes

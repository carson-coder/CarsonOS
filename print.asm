print_char: 
    mov ah, 0x0e
    int 0x10
    ret

print:
    pusha

print.start:
    mov al, [bx] ; bx is the address of string
    cmp al, 0
    je print.done ; current char is 0, end of string reached

    mov ah, 0x0e ; tty
    int 0x10
    add bx, 1
    jmp print.start

print.done:
    popa
    ret

print_nl:
    pusha

    mov ah, 0x0e
    mov al, 0x0a ; newline
    int 0x10
    mov al, 0x0d ; carriage
    int 0x10

    popa
    ret

%include "print.hex.asm"
[org 0x7C00]

mov bx, HELLO_MSG
call print

mov bx, GOODBYE_MSG
call print

jmp $

%include "print.asm"

HELLO_MSG:
    db "Hello, World!", 0

GOODBYE_MSG:
    db "Goodbye!", 0

times 510-($-$$) db 0

dw 0xAA55

times 256 dw 0xDADA
times 256 dw 0xFACE
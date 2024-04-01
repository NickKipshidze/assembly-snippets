[org 0x7C00]

xor ax, ax
mov ds, ax
mov ss, ax
mov sp, 0x7C00

mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print

call switch_to_pm

jmp $

%include "print.asm"
%include "gdt.asm"
%include "printpm.asm"
%include "switch.asm"

[bits 32]

BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call printpm

    jmp $

MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PROT_MODE db "Successfully landed in 32-bit protected mode", 0

times 510-($-$$) db 0
dw 0xAA55
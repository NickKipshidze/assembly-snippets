print:
    pusha
    mov ah, 0x0E
    
    loop:
        mov al, [bx]
        int 0x10
        inc bx
        cmp byte [bx], 0
        jne loop

    mov al, 0x0A
    int 0x10
    mov al, 0x0D
    int 0x10

    popa
    ret

printhex:
    pusha
    mov bx, HEX_OUT ; Not implemented yet :(
    call print
    popa
    ret

HEX_OUT: db "0x0000", 0
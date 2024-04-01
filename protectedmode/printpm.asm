[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0F

printpm:
    pusha
    mov edx, VIDEO_MEMORY

printpm_loop:
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK

    cmp al, 0
    je printpm_done

    mov [edx], ax

    add ebx, 1
    add edx, 2

    jmp printpm_loop

printpm_done:
    popa
    ret

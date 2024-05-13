extern printf
global main

section .data
msg db "i: %d", 0xa, 0

section .text

main:
    push ebp
    mov ebp, esp

    ; for (start; end; increment)
    xor eax, eax; index

_loop:

    mov [esp - 4], eax

    push eax
    push msg
    call printf
    add esp, 8

    mov eax, [esp - 4]
    inc eax
    cmp eax, 10
    jne _loop ; jump if not equals to

    mov esp, ebp
    pop ebp

    ret

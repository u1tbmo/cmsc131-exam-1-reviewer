global _start

section .data
    value dd 0
    num db 19
    ans db 0

section .text
_start:
    mov dword[value], 27    ; value = 27
    mov al, byte[num]
    mov byte[ans], al       ; ans = num 

terminate:
    mov rax, 60
    xor rdi, rdi
    syscall
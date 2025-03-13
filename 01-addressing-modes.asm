global _start

section .data
    val db 130
section .text
_start:
    mov al, 23          ; register, immediate
    mov bl, al          ; register, register
    mov cl, byte[val]   ; register, memory
    mov rdx, val        ; register, memory

terminate:
    mov rax, 60
    xor rdi, rdi
    syscall
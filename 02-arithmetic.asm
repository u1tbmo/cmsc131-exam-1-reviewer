global _start

section .data
    num1 db 73
    num2 db 42
    ans db 0
    ans2 db 0
    ans3 dw 0
    ans4 db 0
    rem db 0

    i db 0
section .text
_start:
    jmp addition

addition:
    mov al, byte[num1]
    add al, byte[num2]
    mov byte[ans], al       ; ans = num1 + num2
    
    inc byte[i]             ; i++

    mov rax, 0              ; reset register

subtract:
    mov al, byte[num1]
    sub al, byte[num2]
    mov byte[ans2], al      ; ans2 = num1 - num2

    dec byte[i]             ; i--

    mov rax, 0              ; reset regiser

multiply:  
    mov al, byte[num1]
    mul byte[num2]
    mov word[ans3], ax      ; ans3 = num1 * num2

    mov rax, 0              ; reset regiser

divide:
    mov al, byte[num1]
    div byte[num2]
    mov byte[ans4], al      ; ans4 = num1 / num2
    mov byte[rem], ah       ; rem = num1 % num2

terminate:
    mov rax, 60
    xor rdi, rdi
    syscall
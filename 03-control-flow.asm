global _start

section .data
    a db -1
    b db -2
    x db 1
    y db 2
    z db 1

section .text
_start:
    mov al, [a]
    mov bl, [b]
    mov r8b, [x]
    mov r9b, [y]
    mov r10b, [z]

    cmp r8b, r9b        ; if x == y:
    je equal            ;   goto equal

    cmp r8b, r9b        ; if x != y:
    jne not_equal       ;   goto not_equal
    
    jmp terminate       ; should never happen
    
equal:
    jmp terminate       ; should never happen

not_equal:
    cmp r8b, r10b       ; if (x == z):
    je finally_equal    ;   goto finally_equal
    
    jmp terminate       ; should never happen

finally_equal:
    cmp r8b, r9b        ; if (x < y):
    jb below            ;   goto below
    
    jmp terminate       ; should never happen

below:
    cmp r9b, r10b       ; if (y <= z):
    jbe below2          ;   goto below2

    cmp r9b, r10b       ; if (y > z):
    jae above            ;   goto above

below2:
    jmp terminate       ; should never happen

above:
    cmp r8b, r10b       ; if (x >= z):
    ja above2          ;   goto above2

    cmp al, bl            ; if (a == b):
    je delusion_equal   ;   goto delision_equal

    cmp al, bl            ; if (a > b):
    jg greater          ;   goto greater

above2:
    jmp terminate       ; should never happen

delusion_equal:
    jmp terminate       ; should never happen

greater:
    cmp bl, al            ; if (b < a):
    jl lesser           ;   goto lesser

lesser:
    jmp terminate       ; you get the idea


terminate:
    mov rax, 60
    xor rdi, rdi
    syscall
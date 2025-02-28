; length
; input:
;   - rsi: pointer to string
; output:
;   - rax: length of string
length:
    mov rdi, rsi
    mov rax, rdi

increment:
    cmp byte [rax], 0
    jz finish
    inc rax
    jmp increment

finish:
    sub rax, rdi
    ret
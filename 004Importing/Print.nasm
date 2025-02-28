%include "LengthDetection.nasm" 

; print
; input
;   - rsi: memory address to the string
print:
    call length

    mov rdx, rax
    mov rdi, 1
    mov rax, 1
    syscall

    ret 
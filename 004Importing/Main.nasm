%include "Print.nasm"
; imports procedures from a given nasm file

section .data
    msg1 db "Hello, World!", 0Ah, 0 
    msg2 db "Bye, World!", 0Ah, 0

section .text
global _start

_start:    
    mov rsi, msg1
    call print  

    mov rsi, msg2
    call print

    mov rdi, 0
    mov rax, 60
    syscall

; IMPORTANT NOTE
; When compiling this, you should only compile and link the "Main.nasm" file. NASM automatically
; takes care of include statements.
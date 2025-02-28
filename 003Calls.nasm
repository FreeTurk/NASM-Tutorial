section .data
    msg1 db "Hello, World!", 0Ah, 0 ; now to explain why the string ends with a 0:
                                    ; in the procedure increment, we compare the letters of the string
                                    ; byte by byte to see if it ends in 0 to see if we have hit the end
                                    ; if you end all of your strings in 0, you can just compare the 
                                    ; letters' bytes against zero 
    msg2 db "Bye, World!", 0Ah, 0

section .text
global _start

_start:    
    mov rsi, msg1 ; the print procedure will require the string, which we will give through
                  ; rsi. this is because the write syscall will also use rsi for our string
                  ; so we do not need to implement anything else and the syscall can directly
                  ; pull the string value through rsi if necessary.
    call print    ; calls the procedure (basically like calling a function in any other language)

    mov rsi, msg2
    call print

    mov rdi, 0
    mov rax, 60
    syscall

print:
    call length

    mov rdx, rax
    mov rdi, 1
    mov rax, 1
    syscall

    ret ; ret means return, it returns the whole code back to where it was called from
        ; so for example the ret on line 34 will loop the code back to either line 17
        ; or to line 20 depending on which string it was printing
        ; unlike other languages, return cannot actually return any values, but any values
        ; that was pushed to a register during the runtime of this procedure will persist
        ; even if you returned to a previous line

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
    ret ; this will return back to line 27

section .data
    msg db "Hello, World! This is exciting!", 0Ah

section .text
global _start

_start:
    mov rdi, msg ; rdi will be 1 anyways when calling sys_write (code 1), so lets use rdi as a temporary storage for the string's memory address 
    mov rax, rdi ; same with rax, but in this instance we will also do some editing on rax

increment:
    cmp byte [rax], 0 ; while rax by itself is a memory address at the start of our string,
                      ; [rax] is the character at that exact memory address. byte [rax] 
                      ; returns that character as a bytecode.
                      ; cmp compares two values for a jump later
    jz print          ; jz jumps to a procedure if the previous cmp equaled zero.
                      ; For a list of jump comparators, refer to Cheatsheet.md
    inc rax           ; inc increments the memory address at rax. So basically, rax now
                      ; points to the next character. This only runs if the previous
                      ; jz has failed
    jmp increment     ; self explanatory, jumps to the increment procedure

print:
    sub rax, rdi      ; subtracts rdi from rax, and pushes the result to rax
                      ; since in the previous proc, you increased rax until the line end
                      ; rax now points to the memory address at the end of the string
                      ; while rdi points to the start of the string, so rax - rdi should
                      ; now be equal to the length of the string

    mov rdx, rax
    mov rsi, msg
    mov rdi, 1
    mov rax, 1
    syscall

    mov rdi, 0
    mov rax, 60
    syscall
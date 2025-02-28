section .data ; section where you define constants
    hello db 'Hello, World!', 0Ah, 0 ; 0Ah is end line, db is a double word (so a data type)

section .text ; section where you define the algorithmic stuff (as far as I can understand)
    global _start ; the entry point

_start:
    mov rdx, 14 ; length of string, refer to Cheatsheet.md
    mov rsi, hello ; memory address for the string itself, refer to Cheatsheet.md 
    mov rdi, 1 ; file descriptor to output to, refer to Cheatsheet.md
    mov rax, 1 ; system call for write, refer to Cheatsheet.md 
    syscall ; calls the given system call from rax  

    mov rdi, 0 ; exit code 0, exits with no errors
    mov rax, 60 ; system call for exit, refer to Cheatsheet.md
    syscall
format ELF64
public start

extrn printf
extrn func_sofiia_sort

section '.text' executable

start:
        lea     rdi, [arr]                      ; register to store an array
        mov     rsi, 5                          ; size of an array
        ;mov    rsi, length
        call    func_sofiia_sort
        xor     rbx, rbx                        ; rbx = 0

print:
        lea     rdi, [to_print]                 ; text to print
        mov     rsi, [arr + rbx * 8]            ; array element to be printed
        xor     rax, rax                        ; rax = 0
        call    printf
        add     rbx, 1
        cmp     rbx, 5
        ;cmp    rbx, length                     ; try this method
        jnz     print

mov rax, 60
xor rdi, rdi
syscall

section '.data' writable

length	    dq 5
arr	        dq 1, 3, 2, 5, 4
to_print    db "%lli",0xa,0x0
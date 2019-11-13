format ELF64 executable 3

include 'fasm/import64.inc'
entry main
interpreter '/lib64/ld-linux-x86-64.so.2'
needed 'libc.so.6'

import printf

segment readable executable

main:
        push    rbp                             ; save calling function's stack frame (rbp/ebp)
        mov     rbp, rsp                        ; make a new stack frame on top of our caller's stack
        sub     rsp, 16                         ; allocate 16 bytes of stack space for this function's local variable
        lea     rsi, [arr]
        jmp     setlimit

setlimit:
        push    r8
        mov     r8, [length]
	    shl	    r8, 3
	    sub	    r8, 8

beginning:
        mov     rbx, 0                          ; index to move through an array
        mov     r9, 0                           ; identify if an array is sorted

comparison:
        lea     rdx, [rsi + rbx * 8]            ; left number in pair
        mov     rax, [rdx + 8]                  ; rightr number in pair

        cmp     [rdx], rax
        jle     noswap

;swaping
        mov     rcx, [rdx]
        mov     [rdx + 8], rdx
        mov     [rdx], rax
        mov     r9, 1

noswap:
        inc     rbx
        cmp     rbx, r8
        jnz     comparison


cmp     r9, 1
jnz     beginning

xor rbx, rbx
jmp     print

print:
    mov rdi, to_print               ; for printf
    mov rsi, [arr + rbx*8]
    xor rax, rax

    call [printf]

    add rbx, 1
    cmp rbx, [length]
    jnz print

mov     rsp, rbp
pop     rbp

mov rax, 60
xor rsi, rsi
syscall

segment readable writable

length      dq 5
arr         dq 1, 4, 3, 5, 2
to_print    db '%ld',0xa,0x0        ; long dec, \n, the end of str line

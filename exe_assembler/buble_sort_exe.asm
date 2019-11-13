format ELF64 executable 3
entry start

;include 'fasm/import64.inc'
;interpreter '/lib64/ld-linux-x86-64.so.2'
;needed 'libc.so.6'

;import printf

segment readable executable

start:
        mov     r8, [length]
        shl     r8, 3
        sub     r8, 8

beginning:
        mov     r10, 0                          ; index to move through an array
        mov     r9, 0                           ; identify if an array is sorted

comparison:
        lea     rax, [arr + r10 * 8]            ; left number in pair
        mov     rbx, [rax + 8]                  ; rightr number in pair
        cmp     [rax], rbx
        jle     noswap

	;swaping
        mov     rcx, [rax]
        mov     rax, rbx
        mov     [rax + 8], rcx
        inc     r9

noswap:
        inc     r10
        cmp     r10, r8
        jnz     comparison

cmp     r9, 1
jnz     beginning

xor rbx, rbx
;jmp     print

;print:
;    mov rdi, to_print               ; for printf
;    mov rsi, [arr + rbx * 8]
;    xor rax, rax

;    call [printf]

;    add rbx, 1
;    cmp rbx, [length]
;    jnz print

mov rax, 60
xor rsi, rsi
syscall

segment readable writable

length	    dq 5
arr	        dq 1, 3, 2, 5, 4
;to_print    db "%ld",0xa,0x0

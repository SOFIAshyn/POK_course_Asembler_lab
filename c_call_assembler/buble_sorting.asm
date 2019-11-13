format ELF64

section '.text' executable

;entry bubleSorting

bubleSorting:
    push    rbp                             ; save calling function's stack frame (rbp/ebp)
    mov     rbp, rsp                        ; make a new stack frame on top of our caller's stack
    sub     rsp, 16                         ; allocate 16 bytes of stack space for this function's local variables

	lea     rdx, [rsi - 1]			        ; save length of an array
	mov     r8, rdx

	lea     r9, [rdi + 8]			        ; pointer to 0th element of array that was sent
	mov     rbx, 0                          ; index to move through an array
    mov     byte [swap], 0                  ; identify if an array is sorted

comparison:
        mov     rax, [r9 + rbx]
        cmp     rax, [r9 + rbx + 8]
        jle     noswap

;swaping
        mov     rdx, [r9 + rbx]
        mov     [r9 + rbx + 8], rax
        mov     [r9 + rbx], rdx
        mov     byte [swap], 1

noswap:
        add     rbx, 8
        jmp     setlimit
        cmp     rbx, r8
        jnz     comparison

setlimit:
	shl	r8, 3
	sub	rdx, 8

cmp     byte[swap], 1
jnz     start

mov     rsp, rbp
pop     rbp
ret


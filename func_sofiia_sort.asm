format ELF64
public func_sofiia_sort


func_sofiia_sort:
        dec     rsi                             ; last index is size - 1

bubble_sort:
        mov     r10, 0                          ; index to move through an array
        mov     r9, 0                           ; identify if an array is sorted

comparison:
        lea     rbx, [rdi + r10 * 8]            ; left number in pair
        mov     rax, [rbx + 8]                  ; rightr number in pair
        cmp     [rbx], rax
        jle     noswap

	;swaping
        mov     rdx, [rbx]
        mov     [rbx + 8], rdx
        mov     [rbx], rax                      ; l and r swap
        inc     r9                              ; swap was made

noswap:
        inc     r10
        cmp     r10, rsi
        jnz     comparison

        cmp     r9, 0
        jnz     bubble_sort

        ret
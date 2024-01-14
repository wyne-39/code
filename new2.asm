[org 0x0100]
 
section .data
    array_nums dw 23, 50, 61, 28, 86
    max_value dw 0
 
section .text
    mov bx, 0             ; initialize array index to zero
    mov ax, [array_nums]  ; initialize max_value to the first element of the array
    mov cx, 5           ; loop counter (15 elements - 1)
 
find_max_value:
    add bx, 2             ; advance bx to the next index
    cmp ax, [array_nums+bx] ; compare ax with the current element
    jge continue_loop     ; if greater or equal, continue loop
    mov ax, [array_nums+bx] ; update max_value with the current element
 
continue_loop:
    loop find_max_value   ; repeat the loop
 
    mov [max_value], ax   ; store the maximum value in max_value
 
    mov ax, 0x4c00        ; terminate program
    int 0x21

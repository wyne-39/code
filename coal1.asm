[org 0x0100]
section .data
    prompt db 'Enter 10 characters: $'
    newline db 0xA  ; Newline character for formatting
 
section .bss
    user_input resb 10  ; Buffer to store user input
 
section .text
    global _start
 
_start:
    ; Display prompt
    mov ah, 9
    mov dx, prompt
    int 21h
 
    ; Take 10 characters input from the user
    mov ecx, 10
    mov edi, user_input
input_loop:
    mov ah, 1
    int 21h
    mov [edi], al
    inc edi
    loop input_loop
 
    ; Print characters in reverse order
    mov ecx, 10
    mov edi, user_input
print_loop:
    dec edi
    mov al, [edi]
    ; Check for newline character to determine the end of input
    cmp al, newline
    je end_program
    ; Print the character
    mov ah, 2
    int 21h
    loop print_loop
 
end_program:
    ; Exit program
    mov ah, 4Ch
    int 21h


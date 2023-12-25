section .data
    multiplier dw 5678h 
    multiplicand dw 1234h  
    result dw 0,  
section .text
    global _start
_start:
    mov ax, multiplicand    
    mov bx, multiplier     
    xor dx, dx              
    mul_loop:
      test bx, 1          
     jz no_addition      
     add result, ax       
     adc dx, 0            
    no_addition:
    shr bx, 1            
    rcl result, 1        
    loop mul_loop       
    mov eax, 1      
    xor ebx, ebx   
    int 0x21       

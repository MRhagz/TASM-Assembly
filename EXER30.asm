; Filename: EXER30.ASM
; Programmer Name: MOEN MALONE I. RAGO
; Date: September 28, 2024
; Description : Make a program to input two integers. Compare the two
; integers. Display which one is smaller and bigger of the
; two integers.


.model small
.stack 100h
.data
    input1 db 'Enter first integer: $'
    input2 db 13,10,'Enter second integer: $'
    in1 dw ?
    in2 dw ?
    big db 20 DUP ('$')
    smol db 20 DUP ('$')
    res db 13,10,'Bigger: $'
    res1 db 13,10,'Smaller: $'

.code

itoa:
    push ax
    push bx
    push cx
    push dx

    mov cx, 0            ; Counter for digits
    mov bx, 10           ; Base for decimal conversion

itoa_loop1:
    xor dx, dx           ; Clear DX before dividing
    div bx               ; AX / BX, result in AX, remainder in DX
    push dx              ; Push remainder onto stack
    inc cx               ; Count the number of digits
    cmp ax, 0            ; Check if quotient is zero
    jne itoa_loop1       ; Repeat if not

itoa_loop2:
    pop dx               ; Pop the last remainder
    add dl, '0'          ; Convert to ASCII
    mov ah, 02h          ; Print character function
    int 21h              ; Interrupt to print character
    dec cx               ; Decrease the digit counter
    cmp cx, 0            ; Check if finished printing all digits
    jne itoa_loop2       ; Continue if not

    pop dx
    pop cx
    pop bx
    pop ax
    ret

start:
    mov ax, @data
    mov ds, ax

    lea dx, input1
    mov ah, 9
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov ah, 0
    mov in1, ax

    lea dx, input2
    mov ah, 9
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov ah, 0
    mov in2, ax


    mov ax, in1
    mov bx, in2

    cmp ax, bx
    jg isbigger   ; Jump to isbigger if in1 > in2
    jl islower    ; Jump to islower if in1 < in2

isbigger:

    lea dx, res
    mov ah, 9
    int 21h

    mov ax, in1
    call itoa    

    lea dx, res1
    mov ah, 9
    int 21h

    mov ax, in2
    call itoa   

    jmp done     

islower:
    lea dx, res
    mov ah, 9
    int 21h

    mov ax, in2
    call itoa    

    lea dx, res1
    mov ah, 9
    int 21h

    mov ax, in1
    call itoa    

done:
    mov ah, 4Ch
    int 21h
end start

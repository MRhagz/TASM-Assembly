; Filename: EXER31.ASM
; Programmer Name: MOEN MALONE I. RAGO
; Date: September 28, 2024
; Description : Create a program to input an integer. Using a loop, display
; from 1 to the integer value entered by the user.

.model small
.stack 100h
.data
    num dw ?
    prompt db 'Enter an integer: $'
.code
start:
    mov ax, @data
    mov ds, ax

    mov cx, 1

    lea dx, prompt
    mov ah, 9
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov ah, 0
    mov num, ax

    mov bx, num

    cmp cx, bx
    jl conti

conti:
    mov ah,02h
    mov dl,0ah
    int 21h

    mov ax, cx
    call itoa

    inc cx
    cmp cx, bx
    jle conti

    mov ah, 4Ch
    int 21h

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

int 27h
end start
; Filename: EXER28.ASM
; Programmer Name: MOEN MALONE I. RAGO
; Date: SEPTEMBER 28, 2024
; Description: This assembly language program will ask for the user to input two integers,
; divide the firsts integer by the second integer, and display the quotient of the two integers.

.model small
.stack 100h
.data
    prompt1             db 'Enter dividend: $'
    prompt2             db 13, 10, 'Enter divisor: $'
    result_msg          db 13, 10, 10, 'Quotient: $'
    remainder_msg       db 13, 10, 'Remainder: $'
    error_msg           db 13, 10, 'Error: Division by zero!$'
    buffer              db 6,?,6 dup('$')  ; Buffer for input (max 5 digits + sign)

    num1                dw ?
    num2                dw ?
    quotient            dw ?
    remainder           dw ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display first prompt
    lea dx, prompt1
    mov ah, 9
    int 21h

    ; Read first number
    call read_number
    mov num1, ax

    ; Display second prompt
    lea dx, prompt2
    mov ah, 9
    int 21h

    ; Read second number
    call read_number
    mov num2, ax

    ; Check for division by zero
    cmp num2, 0
    je division_by_zero

    ; Perform division
    mov dx, 0       ; Clear DX for signed division
    mov ax, num1
    cwd             ; Sign-extend AX into DX:AX
    idiv num2       ; Signed division
    mov quotient, ax
    mov remainder, dx

    ; Display quotient
    lea dx, result_msg
    mov ah, 9
    int 21h
    mov ax, quotient
    call print_signed_number

    ; Display remainder
    lea dx, remainder_msg
    mov ah, 9
    int 21h
    mov ax, remainder
    call print_signed_number

    jmp end_program

division_by_zero:
    ; Display error message
    lea dx, error_msg
    mov ah, 9
    int 21h

end_program:
    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

read_number proc
    ; Read string input
    mov ah, 0Ah
    lea dx, buffer
    int 21h

    ; Convert string to number
    xor ax, ax      ; Clear AX
    xor cx, cx      ; Clear CX
    mov cl, [buffer+1]  ; Get length of input
    lea si, buffer+2    ; Point to start of string
    mov bx, 10      ; Base 10

convert_loop:
    mul bx          ; AX = AX * 10
    mov dl, [si]    ; Get next digit
    sub dl, '0'     ; Convert ASCII to number
    add ax, dx      ; Add to total
    inc si          ; Move to next digit
    loop convert_loop
    ret
read_number endp

print_signed_number proc
    ; AX contains the 16-bit signed number to print
    push ax
    push bx
    push cx
    push dx

    mov bx, ax      ; Store the original number in BX
    mov cx, 0       ; Digit counter
    
    ; Check if the number is negative
    test ax, ax
    jns positive_number
    
    ; If negative, print minus sign and negate the number
    push ax
    mov dl, '-'
    mov ah, 2
    int 21h
    pop ax
    neg ax

positive_number:
    mov bx, 10      ; Divisor

divide_loop:
    xor dx, dx      ; Clear DX for division
    div bx          ; Divide AX by 10, quotient in AX, remainder in DX
    push dx         ; Push remainder (digit) to stack
    inc cx          ; Increment digit counter
    test ax, ax
    jnz divide_loop ; If not zero, continue dividing

    ; If the number was zero, print '0'
    cmp cx, 0
    jne print_loop
    mov dl, '0'
    mov ah, 2
    int 21h
    jmp end_print

print_loop:
    pop dx          ; Pop digit from stack
    add dl, '0'     ; Convert to ASCII
    mov ah, 2       ; DOS print character function
    int 21h
    loop print_loop ; Repeat for all digits

end_print:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_signed_number endp

end main
; Filename: EXER27.ASM
; Programmer Name: MOEN MALONE I. RAGO
; Date: SEPTEMBER 28, 2024
; Description: This assembly language program will ask the user to input two integers,
; subtract the second integer from the first integer, and display the difference of the two integers.

.model small                      ; Define a small memory model
.stack 100h                       ; Allocate 256 bytes of stack space
.data                             ; Begin data segment
    prompt1         db 'Enter minuend: $'               ; Prompt for first number input
    prompt2         db 13, 10,'Enter subtrahend: $'     ; Prompt for second number input with line breaks
    result_msg      db 13, 10, 10, 'Difference: $'      ; Message to display before the result
    
    buffer          db 6,?,6 dup('$')           ; Buffer for user input (max 5 digits + sign)
    num1            dw ?                        ; Variable to store the first number
    num2            dw ?                        ; Variable to store the second number
    sum             dw ?                        ; Variable to store the difference of the two numbers

.code                             ; Begin code segment

main proc                         ; Main procedure starts
    mov ax, @data                 ; Initialize data segment
    mov ds, ax                    ; Move data segment address to DS register

    ; Display first prompt
    lea dx, prompt1               ; Load address of first prompt into DX
    mov ah, 9                     ; Set AH to 9 for displaying string
    int 21h                       ; Call DOS interrupt to display prompt

    ; Read first number
    call read_number              ; Call procedure to read first number
    mov num1, ax                  ; Store the first number in num1

    ; Display second prompt
    lea dx, prompt2               ; Load address of second prompt into DX
    mov ah, 9                     ; Set AH to 9 for displaying string
    int 21h                       ; Call DOS interrupt to display prompt

    ; Read second number
    call read_number              ; Call procedure to read second number
    mov num2, ax                  ; Store the second number in num2

    ; Calculate difference
    mov ax, num1                  ; Move the first number into AX
    sub ax, num2                  ; Subtract the second number from AX
    mov sum, ax                   ; Store the difference in the sum variable

    ; Display result message
    lea dx, result_msg            ; Load address of result message into DX
    mov ah, 9                     ; Set AH to 9 for displaying string
    int 21h                       ; Call DOS interrupt to display message

    ; Display difference
    mov ax, sum                   ; Move the difference into AX
    call print_number             ; Call procedure to print the difference

    ; Exit program
    mov ah, 4Ch                   ; Set AH to 4Ch for terminating program
    int 21h                       ; Call DOS interrupt to exit
main endp                         ; End of main procedure

read_number proc                  ; Procedure to read a number
    ; Read string input
    mov ah, 0Ah                   ; Set AH to 0Ah for buffered input
    lea dx, buffer                ; Load address of buffer into DX
    int 21h                       ; Call DOS interrupt to read input

    ; Convert string to number
    xor ax, ax                    ; Clear AX to prepare for conversion
    xor cx, cx                    ; Clear CX to use as a counter
    mov cl, [buffer+1]            ; Get length of input from buffer
    lea si, buffer+2              ; Point SI to the start of the string
    mov bx, 10                    ; Set BX to 10 for base 10 conversion

convert_loop:                     ; Begin conversion loop
    mul bx                        ; AX = AX * 10 (shift left by one decimal)
    mov dl, [si]                  ; Get next character from string
    sub dl, '0'                   ; Convert ASCII character to numerical value
    add ax, dx                    ; Add converted value to AX
    inc si                        ; Move to the next character
    loop convert_loop             ; Repeat until all characters are processed
    ret                           ; Return from procedure
read_number endp                  ; End of read_number procedure

print_number proc                 ; Procedure to print a number
    ; Convert number to string
    mov cx, 0                     ; Initialize digit counter to 0
    mov bx, 10                    ; Set BX to 10 for division

divide_loop:                      ; Begin divide loop
    xor dx, dx                    ; Clear DX before division
    div bx                        ; Divide AX by 10 (result in AX, remainder in DX)
    push dx                       ; Push remainder (digit) onto stack
    inc cx                        ; Increment digit counter
    test ax, ax                   ; Check if quotient (AX) is zero
    jnz divide_loop               ; If not zero, continue dividing

print_loop:                       ; Begin print loop
    pop dx                        ; Pop digit from stack
    add dl, '0'                   ; Convert digit to ASCII
    mov ah, 2                     ; Set AH to 2 for character output
    int 21h                       ; Call DOS interrupt to print character
    loop print_loop               ; Repeat until all digits are printed
    ret                           ; Return from procedure
print_number endp                 ; End of print_number procedure

end main                          ; End of the program

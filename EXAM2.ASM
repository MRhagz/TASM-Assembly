; Filename: EXAM2.ASM
; CS243 Lab Hands-on Exam No. 2
; First Semester SY 2024-2025
; Student Name: MOEN MALONE I. RAGO
; Date Finished: September 28, 2024

.model SMALL
.stack 100h
.data
    inputChar db ?
    inputNum1 db ?
    inputNum2 db ?

    invalid db 'INVALID CHOICE!$'

    dash db ' - $'
    promptAdd db 'Addition$'
    promptAdd1 db 'Enter first addend: $';
    promptAdd2 db 'Enter second addend: $';
    outputAdd1 db 'First addend is: $'
    outputAdd2 db 'Second addend is: $'

    promptSub db 'Subtraction$'
    promptSub1 db 'Enter minuend: $'
    promptSub2 db 'Enter subtrahend: $'
    outputSub1 db 'Minuend is: $'
    outputSub2 db 'Subtrahend is $'

    promptMul db 'Multiplication$'
    promptMul1 db 'Enter multiplicand: $'
    promptMul2 db 'Enter multiplier: $'
    outputMul1 db 'Multiplicand is: $'
    outputMul2 db 'Multiplier is $'

    promptDiv db 'Division$'
    promptDiv1 db 'Enter dividend: $'
    promptDiv2 db 'Enter divisor: $'
    outputDiv1 db 'Dividend is: $'
    outputDiv2 db 'Divisor is $'

    promptExit db 'Exit$'
    outputExit db 'Exit Program$'

    prompt0 db 'THE CALCULATOR', 13, 10
            db 'Created by: MOEN MALONE I. RAGO', 13, 10
            db 'Date: September 28, 2024', 13, 10, 10, '$'

    prompt1 db 'Main Menu',13,10,'$'
    prompt2 db 'Enter your choice: $'
    prompt3 db 'Thank you.',13,10,'$'

.code 

start:
    mov ax, 3
    int 10h

    ; mov ah, 09h
    ; mov ch, 5       ; row start
    ; mov cl, 0        ; col start
    ; mov dh, 5       ; row end
    ; mov dl, 11      ; col end
    ; mov bh, 070h
    ; int 10h


    mov ax, @data
    mov ds, ax

    lea dx, prompt0
    mov ah, 09h
    int 21h

    lea dx, prompt1
    mov ah, 09h
    int 21h

    mov ah, 09h
    mov bl, 1Fh
    mov cx, 12
    int 10h

    mov ah, 02h
    mov dl, 'a'
    int 21h
    lea dx, dash
    mov ah, 09h
    int 21h
    lea dx, promptAdd
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov dl, 0ah
    int 21h

    ; color
    mov ah, 09h
    mov bl, 2Fh
    mov cx, 15
    int 10h

    mov ah, 02h
    mov dl, 's'
    int 21h
    lea dx, dash
    mov ah, 09h
    int 21h
    lea dx, promptSub
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ah, 09h
    mov bl, 6Fh
    mov cx, 18
    int 10h

    mov ah, 02h
    mov dl, 'm'
    int 21h
    lea dx, dash
    mov ah, 09h
    int 21h
    lea dx, promptMul
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ah, 09h
    mov bl, 4Fh
    mov cx, 12
    int 10h

    mov ah, 02h
    mov dl, 'd'
    int 21h
    lea dx, dash
    mov ah, 09h
    int 21h
    lea dx, promptDiv
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ah, 09h
    mov bl, 70h
    mov cx, 8
    int 10h

    mov ah, 02h
    mov dl, 'e'
    int 21h
    lea dx, dash
    mov ah, 09h
    int 21h
    lea dx, promptExit
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov dl, 0ah
    int 21h

    lea dx, prompt2
    mov ah, 09h
    int 21h

    mov ah, 1
    int 21h
    mov inputChar, al

    mov ah, 02h
    mov dl, 0ah
    int 21h
    mov ah, 02h
    mov dl, 0ah
    int 21h

    cmp inputChar, 'a'
    jz Addition
    cmp inputChar, 'A'
    jz Addition

    cmp inputChar, 's'
    jz Subtraction
    cmp inputChar, 'S'
    jz Subtraction

    cmp inputChar, 'm'
    jz Multiplication
    cmp inputChar, 'M'
    jz Multiplication

    cmp inputChar, 'd'
    jz Division
    cmp inputChar, 'D'
    jz Division

    cmp inputChar, 'e'
    jz Exit
    cmp inputChar, 'E'
    jz Exit
    
    jmp invalidInput

    Addition:
        call doAddition
        jmp terminate
        
    Subtraction:
        call doSubtraction
        jmp terminate

    Multiplication:
        call doMultiplication
        jmp terminate

    Division:
        call doDivision
        jmp terminate

    Exit:
        mov ah, 09h
        mov bl, 7Fh
        mov cx, 12
        int 10h

        lea dx, outputExit
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h

        jmp terminate

    invalidInput: 
        mov ah, 09h
        mov bl, 0CEh
        mov cx, 15
        int 10h

        lea dx, invalid
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h
        
        jmp terminate
    
    doAddition proc
        mov ah, 09h
        mov bl, 1Fh
        mov cx, 8
        int 10h

        lea dx, promptAdd
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, promptAdd1
        mov ah, 09h
        int 21h
        mov ah, 1
        int 21h
        mov inputNum1, al
        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, promptAdd2
        mov ah, 09h
        int 21h
        mov ah, 1
        int 21h
        mov inputNum2, al
        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, outputAdd1
        mov ah, 09h
        int 21h
        mov ah, 02h
        mov dl, inputNum1
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, outputAdd2
        mov ah, 09h
        int 21h
        mov ah, 02h
        mov dl, inputNum2
        int 21h
        mov ah, 02h
        mov dl, 0ah
        int 21h
        ret
    endp doAddition

    doSubtraction proc
        mov ah, 09h
        mov bl, 2Fh
        mov cx, 11
        int 10h

        lea dx, promptSub
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, promptSub1
        mov ah, 09h
        int 21h
        mov ah, 1
        int 21h
        mov inputNum1, al
        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, promptSub2
        mov ah, 09h
        int 21h
        mov ah, 1
        int 21h
        mov inputNum2, al
        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, outputSub1
        mov ah, 09h
        int 21h
        mov ah, 02h
        mov dl, inputNum1
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, outputSub2
        mov ah, 09h
        int 21h
        mov ah, 02h
        mov dl, inputNum2
        int 21h
        mov ah, 02h
        mov dl, 0ah
        int 21h
        ret
    endp doSubtraction

    doMultiplication proc   
        mov ah, 09h
        mov bl, 6Fh
        mov cx, 14
        int 10h

        lea dx, promptMul
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, promptMul1
        mov ah, 09h
        int 21h
        mov ah, 1
        int 21h
        mov inputNum1, al
        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, promptMul2
        mov ah, 09h
        int 21h
        mov ah, 1
        int 21h
        mov inputNum2, al
        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, outputMul1
        mov ah, 09h
        int 21h
        mov ah, 02h
        mov dl, inputNum1
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, outputMul2
        mov ah, 09h
        int 21h
        mov ah, 02h
        mov dl, inputNum2
        int 21h
        mov ah, 02h
        mov dl, 0ah
        int 21h
        ret
    endp doMultiplication

    doDivision proc
        mov ah, 09h
        mov bl, 4Fh
        mov cx, 8
        int 10h

        lea dx, promptDiv
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, promptDiv1
        mov ah, 09h
        int 21h
        mov ah, 1
        int 21h
        mov inputNum1, al
        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, promptDiv2
        mov ah, 09h
        int 21h
        mov ah, 1
        int 21h
        mov inputNum2, al
        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, outputDiv1
        mov ah, 09h
        int 21h
        mov ah, 02h
        mov dl, inputNum1
        int 21h

        mov ah, 02h
        mov dl, 0ah
        int 21h

        lea dx, outputDiv2
        mov ah, 09h
        int 21h
        mov ah, 02h
        mov dl, inputNum2
        int 21h
        mov ah, 02h
        mov dl, 0ah
        int 21h
        ret
    endp doDivision

    terminate:
        mov ah, 02h
        mov dl, 0ah
        int 21h
        lea dx, prompt3
        mov ah, 09h
        int 21h

    mov ax, 4C00h
    int 21h
end start
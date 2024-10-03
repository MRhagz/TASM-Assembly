; Filename: EXER23.ASM
; Programmer name: MOEN MALONE I. RAGO
; Date: September 20, 2024
; Description: This assembly language program is a
; main menu for an ATM

.model SMALL
.stack 100
.DATA
    charInput db ?

     promptString db 13,10,'Cebu Institute of Technology - University',13,10,'$'
     promptString0 db 'Automated Teller Machine' ,13,10,'$'

     promptString1 db 13,10,'Main Menu',13,10,'$'
     promptString2 db '1 Balance Inquiry',13,10,'$'
     promptString3 db '2 Withdrawal',13,10,'$'
     promptString4 db '3 Deposit',13,10,'$'
     promptString5 db '4 Transfer',13,10,'$'
     promptString6 db '5 Bills Payment',13,10,'$'
     promptString7 db '6 Change Pin',13,10,'$'
     promptString8 db '7 Exit',13,10,'$'
     ask db 'Enter number of your choice: $'
     outputString db 13,10,10,'You have chosen $'

     outputString2 db ' Balance Inquiry.',13,10,'$'
     outputString3 db ' Withdrawal.',13,10,'$'
     outputString4 db ' Deposit.',13,10,'$'
     outputString5 db ' Transfer.',13,10,'$'
     outputString6 db ' Bills Payment.',13,10,'$'
     outputString7 db ' Change Pin.',13,10,'$'
     outputString8 db ' Exit.',13,10,'$'

     invalid db ', invalid input.',13,10,'$'

    outputString9 db 13,10,'Thank you for banking with us!',13,10,'$'
    outputStringA db 'Copyright 2024',13,10,'$'
    outputStringB db 'Programmer: MOEN MALONE I. RAGO',13,10,10,'$'

.code
programstart:

    mov ax, @DATA
    mov ds, ax 

    lea dx, promptString
    mov ah, 9
    int 21h 
    lea dx, promptString0
    mov ah, 9
    int 21h 

    lea dx, promptString1
    mov ah, 9
    int 21h 
    lea dx, promptString2
    mov ah, 9
    int 21h
    lea dx, promptString3
    mov ah, 9
    int 21h 
    lea dx, promptString4
    mov ah, 9
    int 21h
    lea dx, promptString5
    mov ah, 9
    int 21h 
    lea dx, promptString6
    mov ah, 9
    int 21h
    lea dx, promptString7
    mov ah, 9
    int 21h 
    lea dx, promptString8
    mov ah, 9
    int 21h

    lea dx, ask
    mov ah, 9
    int 21h 

    mov ah, 1               ; DOS get character function
    int 21h                 ; get single character response
    mov charInput, al

    lea dx, outputString
    mov ah, 9
    int 21h

    mov ah, 02h
    mov dl, charInput
    int 21h

    cmp charInput, '1'             ; typed lowercase 'y' for one?
    jz isOne          ; jz = jump if zero. Yes, it's one
    cmp charInput, '2'
    jz isTwo  
    cmp charInput, '3'
    jz isThree 
    cmp charInput, '4'
    jz isFour 
    cmp charInput, '5'
    jz isFive 
    cmp charInput, '6'
    jz is6 
    cmp charInput, '7'
    jz isSeven
    jnp notValid 
 

isOne:
    lea dx, outputString2
    jmp DisplayChoice

isTwo:
    lea dx, outputString3
    jmp DisplayChoice

isThree:
    lea dx, outputString4
    jmp DisplayChoice

isFour:
    lea dx, outputString5
    jmp DisplayChoice

isFive:
    lea dx, outputString6
    jmp DisplayChoice

is6:
    lea dx, outputString7
    jmp DisplayChoice

isSeven:
    lea dx, outputString8
    jmp DisplayChoice

notValid:
    lea dx, invalid

DisplayChoice:
    mov ah, 9       
    int 21h         

    lea dx, outputString9
    mov ah, 9
    int 21h
    lea dx, outputStringA
    mov ah, 9
    int 21h
    lea dx, outputStringB
    mov ah, 9
    int 21h

    mov ah, 4Ch         ; DOS terminate program function
    int 21h              ; terminate the program

end programstart

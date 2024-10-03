; Filename: EXER25.ASM
; Programmer: MOEN MALONE I. RAGO
; Date: September 28, 2024
; Description: This assembly language program will get 3 string
; inputs and display back the 3 strrings on separate lines

.model small
.stack 100h
.data
    inputString1 db 50 dup ('$') ; reserrve 50 bytes for input stirng
    inputString2 db 50 dup ('$')
    inputString3 db 50 dup ('$')
    promptString1 db 'Enter first string: $'
    promptString2 db 'Enter second string: $'
    promptString3 db 'Enter third string: $'
    outputString1 db 'You entered first string: $'
    outputString2 db 'You entered second string: $'
    outputString3 db 'You entered third string: $'

.code
MAIN proc 
    ;initialize data segment
    mov ax, @data
    mov ds, ax

    ; prompt the user for input first string
    lea dx, promptString1
    mov ah, 09h ; dos function to display string
    int 21h

    ; read input first string
    lea dx, inputString1
    mov ah, 0ah ; dos function to read a string
    int 21h


    ; this is for displaying new line
    mov ah, 02h
    mov cl, 0ah ; 0ah is anew line
    mov dl, cl 
    int 21h 


    ; prompt the user for input second string
    lea dx, promptString2
    mov ah, 09h ; dos function to display string
    int 21h

    ; read input second string
    lea dx, inputString2
    mov ah, 0ah ; dos function to read a string
    int 21h


     ; this is for displaying new line
    mov ah, 02h
    mov cl, 0ah ; 0ah is anew line
    mov dl, cl 
    int 21h 


    ; prompt the user for input third string
    lea dx, promptString3
    mov ah, 09h ; dos function to display string
    int 21h

    ; read input third string
    lea dx, inputString3
    mov ah, 0ah ; dos function to read a string
    int 21h


    ; this is for displaying new line
    mov ah, 02h
    mov cl, 0ah ; 0ah is anew line
    mov dl, cl 
    int 21h 

    ; Display the output message for first string
    lea dx, outputString1
    mov ah, 09h ; dos function to display a string
    int 21h


    
    ; Display the entered first string
    lea dx, inputString1 + 2    ; skip the first two bytes (length and max length)
    mov ah, 09h ; dos function to display a string
    int 21h

    ; this is for displaying new line
    mov ah, 02h
    mov cl, 0ah ; 0ah is anew line
    mov dl, cl 
    int 21h 

    ;display the output message for second string
    lea dx, outputString2
    mov ah, 09h
    int 21h

    ; display the entered second string
    lea dx, inputString2 + 2    ; skip the first two bytes (length and max length)
    mov ah, 09h ; dos function to display a string
    int 21h

    ; this is for displaying new line
    mov ah, 02h
    mov cl, 0ah ; 0ah is anew line
    mov dl, cl 
    int 21h 

    ;display the output message for third string
    lea dx, outputString3
    mov ah, 09h
    int 21h

    ; display the entered third string
    lea dx, inputString3 + 2    ; skip the first two bytes (length and max length)
    mov ah, 09h ; dos function to display a string
    int 21h

    ; Exit program
    mov ax, 4c00h ; dos function to terminate program
    int 21h

MAIN ENDP
END MAIN
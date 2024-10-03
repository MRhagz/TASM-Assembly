; Filename: DEMO5.ASM
; Programmer Name: YOUR FULLNAME HERE
; Date: DATE TODAY
; Description: This assembly language program will get 3 string inputs and
; display back the 3 strings on one lines.
 
.MODEL SMALL
.STACK 100h
.DATA
    firstName DB 50 DUP('$')  ; Reserve 50 bytes for input string
    middleName DB 50 DUP('$')
    lastName DB 50 DUP('$')
    studentId DB 50 DUP('$')
    address DB 50 DUP('$')
    course DB 50 DUP('$')
    year DB 50 DUP('$')
    bdayMonth DB 50 DUP('$')
    bdayDay DB 50 DUP('$')
    bdayYear DB 50 DUP('$')
    emailAdd DB 50 DUP('$')

    promptString db 13,10,'Cebu Institute of Technology - University',13,10,'$'
    promptString0 db 'STUDENT ENROLLMENT FORM',13,10, '$'
    promptString1 db 13,10,'Please enter the following information',13,10,'$'
    promptStringID db 'Student ID Number: $'
    promptString2 DB 'First Name: $'
    promptString3 DB 'Middle Name: $'
    promptString4 DB 'Last Name: $'
    promptString5 db 'Address: $'
    promptString6 db 'Course: $'
    promptString7 db 'Year: $'
    promptString8 db 'Birthday Month: $'
    promptString9 db 'Birthday Day: $'
    promptStringA db 'Birthday Year: $'
    promptStringB db 'Email Address: $'

    outputString db 13,10,'SUMMARY',13,10,'$'
    outputString0 db 'Pelase check if all information are correct.',13,10,'$'

    outputString1 db 'ID Number: $'
    outputString2 db 'Full Name: $'
    outputString3 db 'Address: $'
    outputString4 db 'Course & Year: $'
    outputString5 db 'Birthday: $'
    outputString6 db 'Email Address: $'

    outputString7 db 13,10,10,'Thank you for enrolling at CIT-U',13,10,'$'
    outputString8 db 'Copyright 2024',13,10,'$'
    outputString9 db 'Programmer: MOEN MALONE I. RAGO',13,10,'$'
 
    newline db 0Dh, 0Ah, '$' ; carriage return (0Dh) and line feed (0Ah)
.CODE

MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX
 
    ; Prompt the user for input first string
    LEA DX, promptString
    MOV AH, 09h               ; DOS function to display a string
    INT 21h
    LEA DX, promptString0
    MOV AH, 09h               ; DOS function to display a string
    INT 21h
    LEA DX, promptString1
    MOV AH, 09h               ; DOS function to display a string
    INT 21h

    lea dx, promptStringID
    mov ah, 09h
    int 21h
    ; Read input first string
    LEA DX, studentId
    MOV AH, 0Ah               ; DOS function to read a string
    INT 21h

    call print_newline
    
    lea dx, promptString2
    mov ah, 09h
    int 21h
    lea dx, firstName
    mov ah, 0ah
    int 21h
 
    call print_newline

    lea dx, promptString3
    mov ah, 09h
    int 21h
    lea dx, middleName
    mov ah, 0Ah
    int 21h

    call print_newline

    lea dx, promptString4
    mov ah, 09h
    int 21h
    lea dx, lastName
    mov ah, 0ah
    int 21h
    
    call print_newline

    lea dx, promptString5
    mov ah, 09h
    int 21h
    lea dx, address
    mov ah, 0ah
    int 21h

    call print_newline

    lea dx, promptString6
    mov ah, 09h
    int 21h
    lea dx, course
    mov ah, 0ah
    int 21h

    call print_newline

    lea dx, promptString7
    mov ah, 09h
    int 21h
    lea dx, year
    mov ah, 0ah
    int 21h

    call print_newline

    lea dx, promptString8
    mov ah, 09h
    int 21h
    lea dx, bdayMonth
    mov ah, 0ah
    int 21h

    call print_newline

    lea dx, promptString9
    mov ah, 09h
    int 21h
    lea dx, bdayDay
    mov ah, 0ah
    int 21h

    call print_newline

    lea dx, promptStringA
    mov ah, 09h
    int 21h
    lea dx, bdayYear
    mov ah, 0ah
    int 21h

    call print_newline

    lea dx, promptStringB
    mov ah, 09h
    int 21h
    lea dx, emailAdd
    mov ah, 0Ah
    int 21h

    call print_newline


; this is for displaying new line
    lea dx, outputString
    mov ah, 09h 
    int 21h
    lea dx, outputString0
    mov ah, 09h
    int 21h

    call print_newline

    lea dx, outputString1
    mov ah, 09h
    int 21h
    lea dx, studentId + 2
    mov ah, 09h
    int 21h

    call print_newline

    lea dx, outputString2
    mov ah, 09h
    int 21h
    ; xor bx, bx
    ; Set string terminator for firstName
    mov bl, firstName[1]          ; Get length of the input string
    mov firstName[bx+2], '$'       ; Place '$' at the end of the string
    lea dx, firstName + 2          ; Print starting from the actual string
    mov ah, 09h
    int 21h
    mov ah, 02h
    mov dl, ' '
    int 21h
    ; xor bx, bx
    mov bl, middleName[1]
    mov middleName[bx+2], '$'
    mov dx, offset middleName + 2
    mov ah, 9
    int 21h
    mov ah, 02h
    mov dl, ' '
    int 21h
    ; xor bx, bx
    mov bl, lastName[1]
    mov lastName[bx+2], '$'
    mov dx, offset lastName + 2
    mov ah, 9
    int 21h

    call print_newline

    lea dx, outputString3
    mov ah, 9
    int 21h
    mov bl, address[1]
    mov address[bx + 2], '$'
    lea dx, address + 2
    mov ah, 9
    int 21h

    call print_newline

    lea dx, outputString4
    mov ah, 9
    int 21h
    mov bl, course[1]
    mov course[bx + 2], '$'
    lea dx, course + 2
    mov ah, 9
    int 21h
    mov ah, 02h
    mov dl, ' '
    int 21h
    mov bl, year[1]
    mov year[bx + 2], '$'
    lea dx, year + 2
    mov ah, 9
    int 21h

    call print_newline

    lea dx, outputString5
    mov ah, 9
    int 21h
    mov bl, bdayMonth[1]
    mov bdayMonth[bx + 2], '$'
    lea dx, bdayMonth + 2
    mov ah, 9
    int 21h
    mov ah, 02h
    mov dl, ' '
    int 21h
    mov bl, bdayDay[1]
    mov bdayDay[bx + 2], '$'
    lea dx, bdayDay + 2
    mov ah, 9
    int 21h
    mov ah, 02h
    mov dl, ','
    int 21h
    mov ah, 02h
    mov dl, ' '
    int 21h
    mov bl, bdayYear[1]
    mov bdayDay[bx + 2], '$'
    lea dx, bdayYear + 2
    mov ah, 9
    int 21h

     call print_newline

    lea dx, outputString6
    mov ah, 9
    int 21h
    mov bl, emailAdd[1]
    mov emailAdd[bx + 2], '$'
    lea dx, emailAdd + 2
    mov ah, 9
    int 21h
    
    lea dx, outputString7
    mov ah, 9
    int 21h
    lea dx, outputString8
    mov ah, 9
    int 21h
    lea dx, outputString9
    mov ah, 9
    int 21h

    ; Exit program
    MOV AX, 4C00h             ; DOS function to terminate program
    INT 21h

    ; Newline function
print_newline proc
    ; Print the newline (carriage return + line feed)
    lea dx, newline
    mov ah, 09h         ; DOS interrupt 21h, function 09h: print string
    int 21h
    ret
print_newline endp
    MAIN ENDP
END MAIN

; Filename: EXER23.ASM
; Programmer name: MOEN MALONE I. RAGO
; Date: September 20, 2024
; Description: This assembly language program is a
; vehicle sticker registration form

.MODEL SMALL
.STACK 100
      MAXLEN EQU 20

.DATA
 
TEXT    db '                                                                            ', 0dh, 0ah
        db '      SUMMARY                                                               ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                    Cebu Institute of Technology - University               ', 0dh, 0ah
        db '                       VEHICLE STICKER APPLICATION LETTER                   ', 0dh, 0ah
        db '                           Please fill out form below.                      ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Personnel Type:                    V  Vehicle Sticker Type:           V ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Name of Applicant/Driver:             ID Number:                        ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Mobile Number:                        Address:                          ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Vehicle Make(s)/Brand:                Plate Number:                     ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Vehicle Color:                     V  Vehicle Type:                   V ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                     SUBMIT                                 ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                       Copyright 2024 MOEN MALONE I. RAGO             ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                   Thank You!                               ',13, '$'
 
  promptString db 13,10,'Cebu Institute of Technology - University',13,10,'$'
  promptString0 db 'VEHICLE STICKER APPLICATION FORM' ,13,10,'$'
  promptString1 db 'Please enter the needed information' ,13,10,10,'$'

  appType DB MAXLEN DUP('$')
  appName DB MAXLEN DUP('$')
  mobNum DB MAXLEN DUP('$')
  vehMake DB MAXLEN DUP('$')
  vehColor DB MAXLEN DUP('$')
  vehSticker DB MAXLEN dup('$')
  id DB MAXLEN DUP('$')
  address DB MAXLEN DUP('$')
  plateNum DB MAXLEN DUP('$')
  vehType DB MAXLEN DUP('$')

  summary db 13,10,'SUMMARY',13,10,'$'

  outputPrompt db 'Personnel Type: $'
  outputPrompt0 db 13,10,'Name of Applicant/Driver: $'
  outputPrompt1 db 13,10,'Mobile Number: $'
  outputPrompt2 db 13,10,'Vehicle Make(s)/Brand: $'
  outputPrompt3 db 13,10,'Vehicle Color: $'
  outputPrompt4 db 13,10,'Vehicle Sticker Type: $'
  outputPrompt5 db 13,10,'ID Number: $'
  outputPrompt6 db 13,10,'Address: $'
  outputPrompt7 db 13,10,'Plate Number: $'
  outputPrompt8 db 13,10,'Vehicle Type: $'
.CODE
START:
      mov ax, @data
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

      lea dx, outputPrompt
      mov ah, 9
      int 21h
      lea dx, appType
      mov ah, 0ah
      int 21h

      lea dx, outputPrompt0
      mov ah, 9
      int 21h
      lea dx, appName
      mov ah, 0ah
      int 21h

      lea dx, outputPrompt1
      mov ah, 9
      int 21h
      lea dx, mobNum
      mov ah, 0ah
      int 21h

      lea dx, outputPrompt2
      mov ah, 9
      int 21h
      lea dx, vehMake
      mov ah, 0ah
      int 21h

      lea dx, outputPrompt3
      mov ah, 9
      int 21h
      lea dx, vehColor
      mov ah, 0ah
      int 21h

      lea dx, outputPrompt4
      mov ah, 9
      int 21h
      lea dx, vehSticker
      mov ah, 0ah
      int 21h

      lea dx, outputPrompt5
      mov ah, 9
      int 21h
      lea dx, id
      mov ah, 0ah
      int 21h

      lea dx, outputPrompt6
      mov ah, 9
      int 21h
      lea dx, address
      mov ah, 0ah
      int 21h

      lea dx, outputPrompt7
      mov ah, 9
      int 21h
      lea dx, plateNum
      mov ah, 0ah
      int 21h

      lea dx, outputPrompt8
      mov ah, 9
      int 21h
      lea dx, vehType
      mov ah, 0ah
      int 21h

      
    ; Setup for coloring the backgrounds and texts
    mov ax, 3  
    int 10h     ;
    mov ah, 06h ;
    xor al, al  ;
    xor cx, cx  ;

    ; Forms Grey background
    mov ch, 3   ; Row start       x1
    mov cl, 2   ; Column start    y1
    mov dh, 22  ; Row end         x2
    mov dl, 77  ; Column end      y2
    mov bh, 70h ; Color
    int 10h;
   
    ; Header Red background
    mov ch, 3   ; Row start
    mov cl, 4   ; Column start
    mov dh, 5   ; Row end
    mov dl, 75  ; Column end
    mov bh, 4Fh ; Column end
    int 10h
 
 
 
    ; (Vehicle Sticker Type) User Input Box background
    mov ch, 7   ; Row start
    mov cl, 64  ; Column start
    mov dh, 7   ; Row end
    mov dl, 72  ; Column end
    mov bh, 0Fh ; Color
    int 10h
    ; (Vehicle Sticker Type) Type V Button red
    mov ch, 7   ; Row start
    mov cl, 73  ; Column start
    mov dh, 7   ; Row end
    mov dl, 75  ; Column end
    mov bh, 4Fh ; Color
    int 10h
 
    ; (Personnel) User Input Box background
    mov ch, 7   ; Row start
    mov cl, 30  ; Column start
    mov dh, 7   ; Row end
    mov dl, 37  ; Column end
    mov bh, 0Fh ; Color
    int 10h
    ; (Personnel) Type V Button red
    mov ch, 7   ; Row start
    mov cl, 38  ; Column start
    mov dh, 7   ; Row end
    mov dl, 40  ; Column end
    mov bh, 4Fh ; Color
    int 10h
 
    ; (Vehicle Type) User Input Box background
    mov ch, 15  ; Row start
    mov cl, 64  ; Column start
    mov dh, 15 ; Row end
    mov dl, 72  ; Column end
    mov bh, 0Fh ; Color
    int 10h
    ; (Vehicle Type) Type V Button red
    mov ch, 15  ; Row start
    mov cl, 73  ; Column start
    mov dh, 15  ; Row end
    mov dl, 75  ; Column end
    mov bh, 4Fh ; Color
    int 10h
 
    ; (Vehicle Color) User Input Box background
    mov ch, 15  ; Row start
    mov cl, 30  ; Column start
    mov dh, 15  ; Row end
    mov dl, 37  ; Column end
    mov bh, 0Fh ; Color
    int 10h
    ; (Vehicle Color) Type V Button red
    mov ch, 15  ; Row start
    mov cl, 38  ; Column start
    mov dh, 15  ; Row end
    mov dl, 40  ; Column end
    mov bh, 4Fh ; Color
    int 10h
 
    ; (Applicant) User Input Box background
    mov ch, 9   ; Row start
    mov cl, 30  ; Column start
    mov dh, 9   ; Row end
    mov dl, 40  ; Column end
    mov bh, 0Fh ; Color
    int 10h
    ; (Number) User Input Box background
    mov ch, 11   ; Row start
    mov cl, 30  ; Column start
    mov dh, 11   ; Row end
    mov dl, 40  ; Column end
    mov bh, 0Fh ; Color
    int 10h
    ; (Brand) User Input Box background
    mov ch, 13  ; Row start
    mov cl, 30  ; Column start
    mov dh, 13  ; Row end
    mov dl, 40  ; Column end
    mov bh, 0Fh ; Color
    int 10h
 
    ; (IDNum) User Input Box background
    mov ch, 9   ; Row start
    mov cl, 64  ; Column start
    mov dh, 9  ; Row end
    mov dl, 75  ; Column end
    mov bh, 0Fh ; Color
    int 10h
    ; (Address) User Input Box background
    mov ch, 11   ; Row start
    mov cl, 64  ; Column start
    mov dh, 11   ; Row end
    mov dl, 75  ; Column end
    mov bh, 0Fh ; Color
    int 10h
    ; (PlateNum) User Input Box background
    mov ch, 13  ; Row start
    mov cl, 64  ; Column start
    mov dh, 13  ; Row end
    mov dl, 75  ; Column end
    mov bh, 0Fh ; Color
    int 10h
 
 
 
    ; Submit button background
    mov ch, 17  ; Row start
    mov cl, 33  ; Column start
    mov dh, 19  ; Row end
    mov dl, 46  ; Column end
    mov bh, 4Eh ; Color
    int 10h
 
    ; Yellow blinking text "Thank you"
    mov ch, 24  ; Row start
    mov cl, 2   ; Column start
    mov dh, 24  ; Row end
    mov dl, 77  ; Column end
    mov bh, 08EH; Blinking red background yellow text
    int 10h
 
    ; Yellow Blinking Text "Please Fill Up The Form"
    mov ch, 5   ; Row start
    mov cl, 25  ; Column start
    mov dh, 5   ; Row end
    mov dl, 66  ; Column end
    mov bh, 0CEh; Blinking black background yellow text
    int 10h
 
      ; mov ah, 02h      ; BIOS function to set cursor position
      ; mov bh, 0        ; Page number (usually 0)
      ; mov dh, 1       ; Row 10 (0-based, so this is the 11th row)
      ; mov dl, 3       ; Column 20 (0-based, so this is the 21st column)
      ; int 10h          ; Call BIOS interrupt

      ; lea dx, summary
      ; mov ah, 09h 
      ; int 21h
 
    ; Print the Texts
;     mov ax, @data
;     mov ds, ax
    mov ah, 09h
    lea dx, text
    int 21h


  ; Set cursor position to Row 5, Column 38
    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 7          ; Row 5
    mov dl, 31         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, appType + 2
    mov ah, 09h
    int 21h
  ; Set cursor position to Row 5, Column 38
    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 7          ; Row 5
    mov dl, 65         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, vehSticker + 2
    mov ah, 09h
    int 21h

    ; Set cursor position to Row 5, Column 38
    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 9          ; Row 5
    mov dl, 31         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, appName + 2
    mov ah, 09h
    int 21h
    ; Set cursor position to Row 5, Column 38
    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 9          ; Row 5
    mov dl, 65         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, id + 2
    mov ah, 09h
    int 21h

    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 11          ; Row 5
    mov dl, 31         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, mobNum + 2
    mov ah, 09h
    int 21h
    ; Set cursor position to Row 5, Column 38
    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 11          ; Row 5
    mov dl, 65         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, address + 2
    mov ah, 09h
    int 21h

    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 13          ; Row 5
    mov dl, 31         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, vehMake + 2
    mov ah, 09h
    int 21h
    ; Set cursor position to Row 5, Column 38
    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 13          ; Row 5
    mov dl, 65         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, plateNum + 2
    mov ah, 09h
    int 21h

    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 15          ; Row 5
    mov dl, 31         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, vehColor + 2
    mov ah, 09h
    int 21h
    ; Set cursor position to Row 5, Column 38
    mov ah, 02h        ; BIOS function to set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 15          ; Row 5
    mov dl, 65         ; Column 38
    int 10h            ; Call BIOS interrupt to set cursor position
    ; Print the string at the specified position
    lea dx, vehType + 2
    mov ah, 09h
    int 21h
    
    mov ah, 02h
    mov bh, 0 
    mov dh, 24
    mov dl, 0    
    int 10h 

MOV AX, 4C00h             ; DOS function to terminate program
INT 21h
END START

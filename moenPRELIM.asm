; Filename: Prelim.asm
; CS243 Lab Prelim Exam First Semester SY 2024 - 2025
; Student name: Moen Malone I. Rago
; Date Finished: 09/13/2024
.model small
.stack 100
.data
    text db '                                                                         ', 0dh, 0ah
         db '                   Cebu Institute of Technology - University               ', 0dh, 0ah
         db '                       VEHICLE STICKER APPLICATION FORM                   ', 0dh, 0ah
         db '                        Please fill out the form below.                    ', 0dh, 0ah, 0ah
         db '   Personnel Type:             ______ V     Vehicle Sticker Type:   ________ V ', 0dh, 0ah
         db '   Name of Applicant/Driver:   ______       ID Number:              ________', 0dh, 0ah
         db '   Mobile Number:              ______       Address:                ________ ', 0dh, 0ah
         db '   Vehicle Make(s)/Brand:      ______       Plate Number:           ________ ', 0dh, 0ah
         db '   Vehicle Color:              ______ V     Vehicle Type:           ________ V', 0dh, 0ah, 0ah, 0ah
         db '                                      SUBMIT                      ', 0dh, 0ah, 0ah
         db '                       Copyright 2024 MOEN MALONE I. RAGO       ', 0dh, 0ah, 0ah, 0ah
         db '                                    Thank You!            ', 0dh, 0ah, '$'

.code
    start:
          mov ax, 3
          int 10h
 
    ; header grey background start
          mov ah, 06h
          mov ch, 3        ; row start
          mov cl, 2        ; col start
          mov dh, 3        ; row end
          mov dl, 2        ; col end
          mov bh, 070h
          int 10h
 
    ; header grey background end
          mov ah, 06h
          mov ch, 1        ; row start
          mov cl, 78       ; col start
          mov dh, 3        ; row end
          mov dl, 78       ; col end
          mov bh, 070h
          int 10h
 
    ; header red background
    ; index 0 - 1
          mov ah, 06h
          xor al, al
          xor cx, cx
          mov cl, 3
          mov ch, 1
          mov dl, 77
          mov bh, 4Fh
          int 10h
 
    ; yellow text for pls fill me out
          mov ah, 06h
          mov ch, 3        ; row start
          mov cl, 3        ; col start
          mov dh, 3        ; row end
          mov dl, 76       ; col end
          mov bh, 0CEh     ; blinking red background yellow text
          int 10h
    ;grey background // index 3
          mov ah, 06h
          mov ch, 4
          mov cl, 2
          mov dh, 4
          mov dl, 78
          mov bh, 7Fh
          int 10h
    ;black text // index 4
          mov ah, 06h
          mov ch, 5        ; row start
          mov cl, 2        ; col start
          mov dh, 5        ; row end
          mov dl, 28       ; col end
          mov bh, 070h
          int 10h
    ; index 4 grey background
          mov ah, 06h
          mov ch, 5        ; row start
          mov cl, 39       ; col start
          mov dh, 5        ; row end
          mov dl, 65       ; col end
          mov bh, 070h
          int 10h
    ; index 4 grey background
          mov ah, 06h
          mov ch, 5        ; row start
          mov cl, 78       ; col start
          mov dh, 5        ; row end
          mov dl, 78       ; col end
          mov bh, 070h
          int 10h
   
    ; Gray background
          mov ah, 06h
          mov ch, 6        ; row start
          mov cl, 2        ; col start
          mov dh, 6        ; row end
          mov dl, 28       ; col end
          mov bh, 070h
          int 10h
 
    ; index 5 black text
          mov ah, 06h
          mov ch, 6        ; row start
          mov cl, 39       ; col start
          mov dh, 6        ; row end
          mov dl, 65       ; col end
          mov bh, 070h
          int 10h
 
    ; index 5 black text
          mov ah, 06h
          mov ch, 6        ; row start
          mov cl, 78       ; col start
          mov dh, 6        ; row end
          mov dl, 78       ; col end
          mov bh, 070h
          int 10h
    ; index 6 black text
          mov ah, 06h
          mov ch, 7        ; row start
          mov cl, 2        ; col start
          mov dh, 7        ; row end
          mov dl, 28       ; col end
          mov bh, 070h
          int 10h
 
    ; i6
          mov ah, 06h
          mov ch, 7        ; row start
          mov cl, 39       ; col start
          mov dh, 7        ; row end
          mov dl, 65       ; col end
          mov bh, 070h
          int 10h
 
    ;i6
          mov ah, 06h
          mov ch, 7        ; row start
          mov cl, 78       ; col start
          mov dh, 7        ; row end
          mov dl, 78       ; col end
          mov bh, 070h
          int 10h
    ; index 7 black text
          mov ah, 06h
          mov ch, 8        ; row start
          mov cl, 2        ; col start
          mov dh, 8        ; row end
          mov dl, 28       ; col end
          mov bh, 070h
          int 10h
 
    ; index 7 black text
          mov ah, 06h
          mov ch, 8        ; row start
          mov cl, 39       ; col start
          mov dh, 8        ; row end
          mov dl, 65       ; col end
          mov bh, 070h
          int 10h
 
    ; index 7 black text
          mov ah, 06h
          mov ch, 8        ; row start
          mov cl, 78       ; col start
          mov dh, 8        ; row end
          mov dl, 78       ; col end
          mov bh, 070h
          int 10h
    ; index 8 black text
          mov ah, 06h
          mov ch, 9        ; row start
          mov cl, 2        ; col start
          mov dh, 9        ; row end
          mov dl, 28       ; col end
          mov bh, 070h
          int 10h
    ; 1st V button // index 4
          mov ah, 06h
          mov ch, 5
          mov cl, 38
          mov dh, 5
          mov dl, 38
          mov bh, 4Fh
          int 10h
    ; 2nd V button // index 4
          mov ah, 06h
          mov ch, 5
          mov cl, 77
          mov dh, 5
          mov dl, 77
          mov bh, 4Fh
          int 10h
    ; index 8 3rd V red
          mov ah, 06h
          mov ch, 9
          mov cl, 38
          mov dh, 9
          mov dl, 38
          mov bh, 4Fh
          int 10h
    ;i8 4th v red
          mov ah, 06h
          mov ch, 9
          mov cl, 77
          mov dh, 9
          mov dl, 77
          mov bh, 4Fh
          int 10h
    ; i8 grey n black text
          mov ah, 06h
          mov ch, 9        ; row start
          mov cl, 39       ; col start
          mov dh, 9        ; row end
          mov dl, 65       ; col end
          mov bh, 070h
          int 10h
    ; i8
          mov ah, 06h
          mov ch, 9        ; row start
          mov cl, 78       ; col start
          mov dh, 9        ; row end
          mov dl, 78       ; col end
          mov bh, 070h
          int 10h
    ; i9
          mov ah, 06h
          mov ch, 10       ; row start
          mov cl, 2        ; col start
          mov dh, 10       ; row end
          mov dl, 78       ; col end
          mov bh, 070h
          int 10h
    ; i 10 - 12 background
          mov ah, 06h
          mov ch, 11
          mov cl, 2
          mov dh, 13
          mov dl, 36
          mov bh, 070h
          int 10h
    ; i 10 - 12 background
          mov ah, 06h
          mov ch, 11
          mov cl, 37
          mov dh, 13
          mov dl, 78
          mov bh, 070h
          int 10h
    ; i 10 - 12 submit button ; yellow and red background
          mov ah, 06h
          mov ch, 12       ; r s
          mov cl, 36       ; c s
          mov dh, 12       ; r e
          mov dl, 45       ; c e
          mov bh, 4Eh
          int 10h
    ; i 13 - 14 background
          mov ah, 06h
          mov ch, 14
          mov cl, 2
          mov dh, 15
          mov dl, 78
          mov bh, 070h
          int 10h
    ; i 16 thank u
          mov ah, 06h
          mov ch, 17       ; r s
          mov cl, 0        ; c s
          mov dh, 17       ; r e
          mov dl, 78       ; c e
          mov bh, 08EH     ;
          int 10h
          mov ax, @data
          mov ds, ax
    ; prints our text
          mov ah, 09h
          lea dx, text
          int 21h
               
          int 27h
end start
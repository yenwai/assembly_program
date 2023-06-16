.model small
.stack 100h
.data
    menu db 10, 10, 10, 10, '~~~~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        db '    #                        Raya Festival with APU !                   OO', 10
        db '   # #                          Date: 2 May 2022                      \OOOO/', 10
        db '    #                           Time: 6pm - 10pm                       ', 10
        db '  /   \                        Venue: Center Point', 10, 10
        db '              Come and grab your FREE ondeh-ondeh before its gone !', 10
        db 10, '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        db 10, 10, 15, 32, 15, 32, 15, 32, 'Main Menu', 32, 15, 32, 15, 32, 15, 13, 10
        db '1. Number Patterns', 13, 10
        db '2. Design Patterns', 13, 10
        db '3. Box Type Patterns', 13, 10
        db '4. Nested Loop Patterns', 13, 10
        db '5. Exit program', 13, 10, 10
        db 'Select your choice: $'

    howmany db 10, 'How many shapes do you want (1-9)? $'

    userinput db 10, 10, 'Do you wish to continue? (y/n): $'

    bye db 10, 10, 'Bye bye, have a nice day ! $'
    
    ; for a
    bottomrighta db ?
    bottomrightb db ?
    bottomlefta db ?
    bottomleftb db ?
    upperrighta db ?
    upperrightb db ?
    upperlefta db ?
    upperleftb db ?
    upperleftblank db ?
    bottomleftblank db ?

    drow db ?
    boxrow db ?
    i db ?
    j db ?

.code
jumps

MAIN PROC
home:
    mov ah, 6 
    mov al, 0 
    mov bh, 02Eh
    mov cx, 0 
    mov dh, 40
    mov dl, 90
    int 10h

    mov ah, 2
    mov bh, 0
    mov dh, -2
    mov dl, 25
    int 10h

    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset menu
    int 21h

    mov ah, 01h ; take input
    int 21h

    cmp al, "1"
    je a
    cmp al, "2"
    je b
    cmp al, "3"
    je c
    cmp al, "4"
    je d
    cmp al, "5"
    je exitprogram
    jne home

a: ; first pattern
    mov ah, 02h
    mov dl, 10
    int 21h
    int 21h

    mov cx, 7
    mov upperlefta, 1
    mov upperleftb, 56
    mov upperleftblank, 8
    mov upperrighta, 1
    mov upperrightb, 57

    upperleft:
        dec upperleftblank
        mov bl, upperleftblank

        upperleft3:
            mov dl, 32
            int 21h
            dec bl
            cmp bl, 0
            jne upperleft3

        push cx

        mov cl, upperlefta
        mov al, upperleftb

        upperleft2:
            mov dl, al
            int 21h
            dec al
        loop upperleft2

        mov cl, upperrighta
        mov al, upperrightb
       
        dec cx
        cmp cx, 0
        je lastout
        upperright2:
            mov ah, 2
            mov dl, al
            int 21h
            inc al
        loop upperright2

        lastout:
            mov ah, 2
            mov dl, 0ah
            int 21h
            mov dl, 0dh
            int 21h

            pop cx

            inc upperlefta
            inc upperrighta
            dec upperrightb

    loop upperleft

    mov cx, 8
    mov bottomlefta, 8
    mov bottomleftb, 56
    mov bottomleftblank, 0
    mov bottomrighta, 8
    mov bottomrightb, 50
 
    bottomleft:
        inc bottomleftblank
        mov bx, cx
        mov cl, bottomlefta
        mov al, bottomleftb

        bottomleft2:
            mov dl, al
            int 21h
            dec al
        loop bottomleft2

        mov cl, bottomrighta
        mov al, bottomrightb
        
        dec cx
        cmp cx, 0
        je outlast
        bottomright2:
            mov ah, 2
            mov dl, al
            int 21h
            inc al
        loop bottomright2
        
        outlast:
            mov ah, 2
            mov dl, 0ah
            int 21h
            mov dl, 0dh
            int 21h

            cmp bottomleftblank, 1
            je bottomleft3
            cmp bottomleftblank, 2
            je bottomleft4
            cmp bottomleftblank, 3
            je bottomleft5
            cmp bottomleftblank, 4
            je bottomleft6
            cmp bottomleftblank, 5
            je bottomleft7
            cmp bottomleftblank, 6
            je bottomleft8
            cmp bottomleftblank, 7
            je bottomleft9
        
            bottomleft3:
                mov dl, 32
                int 21h
                jmp here 
            bottomleft4:
                mov dl, 32
                int 21h
                int 21h
                jmp here
            bottomleft5:
                mov dl, 32
                int 21h
                int 21h
                int 21h
                jmp here
            bottomleft6:
                mov dl, 32
                int 21h
                int 21h
                int 21h
                int 21h 
                jmp here
            bottomleft7:
                mov dl, 32
                int 21h
                int 21h
                int 21h
                int 21h 
                int 21h
                jmp here
            bottomleft8:
                mov dl, 32
                int 21h
                int 21h
                int 21h
                int 21h 
                int 21h
                int 21h
                jmp here
            bottomleft9:
                mov dl, 32
                int 21h
                int 21h
                int 21h
                int 21h 
                int 21h
                int 21h
                int 21h 
                jmp here
            
            here:
                mov cx, bx
                dec bottomlefta
                dec bottomrighta
                inc bottomrightb

    loop bottomleft

    jmp prompt

b:  ; second pattern
    mov ah, 02h
    mov dl, 10
    int 21h

    mov i, 1 ; row
    mov j, 1 ; column
    mov bl, i
    mov cl, j
    
    ; take user input
    mov ah, 9
    mov dx, offset howmany
    int 21h
    mov ah, 01h
    int 21h
    cbw
    mov si, ax
    sub si, 48
    mov ah, 2
    mov dl, 10
    int 21h
    int 21h
    
    fori:
        cmp bl, 8
        je exitfor
        cmp bl, 7
        je b4firsti
        cmp bl, 6
        je b4secondi
        cmp bl, 5
        je b4thirdi
        cmp bl, 4
        je b4fourthi
        cmp bl, 3
        je b4thirdi
        cmp bl, 2
        je b4secondi
        cmp bl, 1
        je b4firsti 

        forj:

            b4firsti:
                mov cx, si
                firsti: 
                    mov dl, 35
                    int 21h
                    firstiblank:
                        mov dl, 32
                        int 21h 
                        int 21h
                        int 21h
                        int 21h
                        int 21h
                        int 21h
                        mov dl, 35
                        int 21h 
                loop firsti
                mov dl, 35
                int 21h
                inc bl
                mov dl, 10
                int 21h
                jmp fori 

            b4secondi:
                mov dl, 32
                int 21h 
                mov dl, 35
                int 21h
                mov cx, si
                secondi:
                    mov dl, 32
                    int 21h
                    int 21h
                    int 21h
                    int 21h
                    mov dl, 35
                    int 21h
                    mov dl, 32
                    int 21h
                    int 21h
                    mov dl, 35
                    int 21h
                loop secondi
                inc bl
                mov dl, 10
                int 21h
                jmp fori 

            b4thirdi:
                mov dl, 32
                int 21h 
                int 21h
                mov dl, 35
                int 21h
                mov cx, si
                thirdi:
                    mov dl, 32
                    int 21h
                    int 21h
                    mov dl, 35
                    int 21h
                    mov dl, 32
                    int 21h
                    int 21h
                    int 21h
                    int 21h
                    mov dl, 35
                    int 21h
                loop thirdi
                inc bl
                mov dl, 10
                int 21h
                jmp fori 

            b4fourthi:
                mov dl, 32
                int 21h 
                int 21h
                int 21h
                int 21h
                mov dl, 35
                int 21h
                mov cx, si
                fourthi:
                    mov dl, 32
                    int 21h
                    int 21h
                    int 21h
                    int 21h
                    int 21h
                    int 21h
                    mov dl, 35
                    int 21h
                    mov dl, 32
                    int 21h
                loop fourthi
                inc bl
                mov dl, 10
                int 21h
                jmp fori 

    loop fori 

    exitfor:
        jmp prompt 

c:  ; third pattern
    mov ah, 02h
    mov dl, 10
    int 21h
    int 21h

    mov boxrow, 1

    boxrun:
        cmp boxrow, 9
        je exitbox
        cmp boxrow, 8
        mov cx, 8
        je firstlastrow
        cmp boxrow, 7
        je secondrow
        cmp boxrow, 6
        je thirdrow
        cmp boxrow, 5
        je fourthrow
        cmp boxrow, 4
        je fourthrow
        cmp boxrow, 3
        je thirdrow
        cmp boxrow, 2
        je secondrow
        cmp boxrow, 1
        mov cx, 8
        je firstlastrow
    loop boxrun

    firstlastrow:
        mov dl, 82
        int 21h
        mov dl, 32
        int 21h
    loop firstlastrow

    mov dl, 10
    int 21h
    inc boxrow
    jmp boxrun

    secondrow:
        mov dl, 82
        int 21h
        mov dl, 32
        int 21h
        mov cx, 6

    secondrow1:
        mov dl, 97
        int 21h
        mov dl, 32
        int 21h
    loop secondrow1

    mov dl, 82
    int 21h
    mov dl, 10
    int 21h
    inc boxrow
    jmp boxrun

    thirdrow:
        mov dl, 82
        int 21h
        mov dl, 32
        int 21h
        mov dl, 97
        int 21h
        mov dl, 32
        int 21h
        mov cx, 4

    thirdrow1:
        mov dl, 121
        int 21h
        mov dl, 32
        int 21h
    loop thirdrow1

    mov dl, 97
    int 21h
    mov dl, 32
    int 21h
    mov dl, 82
    int 21h
    mov dl, 10
    int 21h
    inc boxrow
    jmp boxrun

    fourthrow:
        mov dl, 82
        int 21h
        mov dl, 32
        int 21h
        mov dl, 97
        int 21h
        mov dl, 32
        int 21h
        mov dl, 121
        int 21h
        mov dl, 32
        int 21h
        mov cx, 2

    fourthrow1:
        mov dl, 97
        int 21h
        mov dl, 32
        int 21h
    loop fourthrow1

    mov dl, 121
    int 21h
    mov dl, 32
    int 21h
    mov dl, 97
    int 21h
    mov dl, 32
    int 21h
    mov dl, 82
    int 21h
    mov dl, 10
    int 21h

    inc boxrow
    jmp boxrun

    exitbox:
        jmp prompt

d:  ; fourth pattern
    mov ah, 02h
    mov dl, 10
    int 21h
    int 21h ; [enter] 2 times

    mov drow, 1

    d1:
        cmp drow, 7
        jae b4d2
        cmp drow, 6
        je drow6
        cmp drow, 5
        je drow5
        cmp drow, 4
        je drow4
        cmp drow, 3
        je drow3
        cmp drow, 2
        je drow2
        cmp drow, 1
        je drow1

        drow1:
            mov dl, 42
            int 21h
            mov bl, 1

            drow1blank:
                cmp bl, 8
                je drow1printbl
                mov dl, 32
                int 21h 
                inc bl
            loop drow1blank

            drow1printbl:
                mov bl, 1
            drow1print:
                cmp bl, 7
                je incdrow 
                mov dl, 42
                int 21h 
                inc bl 
            loop drow1print
        loop drow1

        drow2:
            mov dl, 10
            int 21h

            mov bl, 1
            drow2first:
                cmp bl, 3
                je drow2blankbl
                mov dl, 42
                int 21h
                inc bl 
            loop drow2first

            drow2blankbl:
                mov bl, 1
            drow2blank:
                cmp bl, 7
                je drow2printbl
                mov dl, 32
                int 21h 
                inc bl
            loop drow2blank

            drow2printbl:
                mov bl, 1
            drow2print:
                cmp bl, 6
                je incdrow
                mov dl, 42
                int 21h 
                inc bl 
            loop drow2print
        loop drow2

        drow3:
            mov dl, 10
            int 21h

            mov bl, 1
            drow3first:
                cmp bl, 4
                je drow3blankbl
                mov dl, 42
                int 21h
                inc bl 
            loop drow3first

            drow3blankbl:
                mov bl, 1
            drow3blank:
                cmp bl, 6
                je drow3printbl
                mov dl, 32
                int 21h 
                inc bl
            loop drow3blank

            drow3printbl:
                mov bl, 1
            drow3print:
                cmp bl, 5
                je incdrow
                mov dl, 42
                int 21h 
                inc bl 
            loop drow3print
        loop drow3

        drow4:
            mov dl, 10
            int 21h

            mov bl, 1
            drow4first:
                cmp bl, 5
                je drow4blankbl
                mov dl, 42
                int 21h
                inc bl 
            loop drow4first

            drow4blankbl:
                mov bl, 1
            drow4blank:
                cmp bl, 5
                je drow4printbl
                mov dl, 32
                int 21h 
                inc bl
            loop drow4blank

            drow4printbl:
                mov bl, 1
            drow4print:
                cmp bl, 4
                je incdrow 
                mov dl, 42
                int 21h 
                inc bl 
            loop drow4print
        loop drow4

        drow5:
            mov dl, 10
            int 21h

            mov bl, 1
            drow5first:
                cmp bl, 6
                je drow5blankbl
                mov dl, 42
                int 21h
                inc bl 
            loop drow5first

            drow5blankbl:
                mov bl, 1
            drow5blank:
                cmp bl, 4
                je drow5printbl
                mov dl, 32
                int 21h 
                inc bl
            loop drow5blank

            drow5printbl:
                mov bl, 1
            drow5print:
                cmp bl, 3
                je incdrow  
                mov dl, 42
                int 21h 
                inc bl 
            loop drow5print
        loop drow5

        drow6:
            mov dl, 10
            int 21h

            mov bl, 1
            drow6first:
                cmp bl, 7
                je drow6blankbl
                mov dl, 42
                int 21h
                inc bl 
            loop drow6first

            drow6blankbl:
                mov bl, 1
            drow6blank:
                cmp bl, 3
                je drow6printbl
                mov dl, 32
                int 21h 
                inc bl
            loop drow6blank

            drow6printbl:
                mov bl, 1
            drow6print:
                cmp bl, 2
                je incdrow 
                mov dl, 42
                int 21h 
                inc bl 
            loop drow6print
        loop drow6

    loop d1

    b4d2:
        mov dl, 10
        int 21h
        int 21h
        mov drow, 1

    d2:
        cmp drow, 7
        jae prompt
        cmp drow, 6
        je d2row6
        cmp drow, 5
        je d2row5
        cmp drow, 4
        je d2row4
        cmp drow, 3
        je d2row3
        cmp drow, 2
        je d2row2
        cmp drow, 1
        je d2row1

        d2row1:
            mov dl, 49
            int 21h
            mov bl, 1

            d2row1blank:
                cmp bl, 8
                je d2row1printbl
                mov dl, 32
                int 21h 
                inc bl
            loop d2row1blank

            d2row1printbl:
                mov bl, 1
                mov dl, 49
            d2row1print:
                cmp bl, 7
                je incd2row  
                int 21h 
                inc dl
                inc bl 
            loop d2row1print
        loop d2row1

        d2row2:
            mov dl, 10
            int 21h
            mov bl, 1
            mov dl, 49
            d2row2first:
                cmp bl, 3
                je d2row2blankbl
                int 21h
                inc dl
                inc bl 
            loop d2row2first

            d2row2blankbl:
                mov bl, 1
            d2row2blank:
                cmp bl, 7
                je d2row2printbl
                mov dl, 32
                int 21h 
                inc bl
            loop d2row2blank

            d2row2printbl:
                mov bl, 1
                mov dl, 50
            d2row2print:
                cmp bl, 6
                je incd2row 
                int 21h 
                inc dl
                inc bl 
            loop d2row2print
        loop d2row2

        d2row3:
            mov dl, 10
            int 21h
            mov bl, 1
            mov dl, 49
            d2row3first:
                cmp bl, 4
                je d2row3blankbl
                int 21h
                inc dl
                inc bl 
            loop d2row3first

            d2row3blankbl:
                mov bl, 1
            d2row3blank:
                cmp bl, 6
                je d2row3printbl
                mov dl, 32
                int 21h 
                inc bl
            loop d2row3blank

            d2row3printbl:
                mov bl, 1
                mov dl, 51
            d2row3print:
                cmp bl, 5
                je incd2row
                int 21h 
                inc dl
                inc bl 
            loop d2row3print
        loop d2row3

        d2row4:
            mov dl, 10
            int 21h
            mov bl, 1
            mov dl, 49
            d2row4first:
                cmp bl, 5
                je d2row4blankbl
                int 21h
                inc dl
                inc bl 
            loop d2row4first

            d2row4blankbl:
                mov bl, 1
            d2row4blank:
                cmp bl, 5
                je d2row4printbl
                mov dl, 32
                int 21h 
                inc bl
            loop d2row4blank

            d2row4printbl:
                mov bl, 1
                mov dl, 52
            d2row4print:
                cmp bl, 4
                je incd2row
                int 21h 
                inc dl
                inc bl 
            loop d2row4print
        loop d2row4

        d2row5:
            mov dl, 10
            int 21h
            mov bl, 1
            mov dl, 49
            d2row5first:
                cmp bl, 6
                je d2row5blankbl
                int 21h
                inc dl
                inc bl 
            loop d2row5first

            d2row5blankbl:
                mov bl, 1
            d2row5blank:
                cmp bl, 4
                je d2row5printbl
                mov dl, 32
                int 21h 
                inc bl
            loop d2row5blank

            d2row5printbl:
                mov bl, 1
                mov dl, 53
            d2row5print:
                cmp bl, 3
                je incd2row
                int 21h 
                inc dl
                inc bl 
            loop d2row5print
        loop d2row5

        d2row6:
            mov dl, 10
            int 21h
            mov bl, 1
            mov dl, 49
            d2row6first:
                cmp bl, 7
                je d2row6blankbl
                int 21h
                inc dl
                inc bl 
            loop d2row6first

            d2row6blankbl:
                mov bl, 1
            d2row6blank:
                cmp bl, 3
                je d2row6printbl
                mov dl, 32
                int 21h 
                inc bl
            loop d2row6blank

            d2row6printbl:
                mov bl, 1
                mov dl, 54
            d2row6print:
                cmp bl, 2
                je incd2row
                int 21h 
                inc dl
                inc bl 
            loop d2row6print
        loop d2row6

    loop d2

    incdrow:
        inc drow
        jmp d1
    loop incdrow

    incd2row:
        inc drow
        jmp d2
    loop incdrow 

    prompt:
        mov ah, 9
        mov dx, offset userinput
        int 21h

        mov ah, 1
        int 21h

        cmp al, "n"
        je exitprogram
        cmp al, "y"
        je home

exitprogram:
    mov ah, 9
    mov dx, offset bye
    int 21h
    mov ah, 4ch
    int 21h

MAIN endp
end MAIN
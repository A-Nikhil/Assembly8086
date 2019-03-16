CLRSCR MACRO 
    MOV AH, 00H
    MOV AL, 02H
    INT 10H
ENDM
SETCURSOR MACRO X, Y
    MOV DL, Y 	; Y COORDINATE or COLUMN
    MOV DH, X	; X COORDINATE or ROW
    MOV BH, 00H	; CURRENT PAGE
    MOV AH, 02H
    INT 10H
ENDM
.DATA
    BCD_X DB ?
    BCD_Y DB ?
    BIN_X DB ?
    BIN_Y DB ?
    MSG1 DB 'ENTER X COORDINATE :$'
    MSG2 DB 'ENTER Y COORDINATE :$'
.CODE
START:
    MOV AX, DATA
    MOV DS, AX
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    CALL READBCD
    MOV BCD_X, AL
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    CALL READBCD
    MOV BCD_Y, AL
    MOV BL, BCD_X
    CALL BCD_TO_BIN
    MOV BIN_X, BL
    MOV BL, BCD_Y
    CALL BCD_TO_BIN
    MOV BIN_Y, BL
    CLRSCR
    SETCURSOR BIN_X, BIN_Y
    MOV AH, 01H
    INT 21H
    MOV AH, 4CH
    INT 21H
    READBCD PROC NEAR
        MOV AH, 01H
        INT 21H
        AND AL,0FH
        MOV CL, 04H
        SHL AL, CL
        MOV BL, AL
        MOV AH, 01H
        INT 21H
        AND AL,0FH
        ADD AL, BL
        RET
        READBCD ENDP
    BCD_TO_BIN PROC NEAR
        PUSH AX
        PUSH CX
        MOV AL, BL
        AND AL, 0F0H
        MOV CL, 04H
        SHR AL, CL
        AND BL, 0FH
        MOV BH, 0AH
        MUL BH
        ADD BL, AL
        POP CX
        POP AX
        RET
        BCD_TO_BIN ENDP
    END START
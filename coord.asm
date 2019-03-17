DISPLAY MACRO MSG
    LEA DX,MSG
    MOV AH,09H
    INT 21H
ENDM
.MODEL SMALL
.STACK 64H
.DATA
    MSG1 DB 10H,13H,"ENTER ROW $" 
    MSG2 DB 10H,13H,"ENTER COLUMN $"
    ROW DB ?
    COL DB ?
.CODE
    START:
        MOV AX,@DATA
        MOV DS,AX
        DISPLAY MSG1
        CALL READ
        MOV ROW,AL
        DISPLAY MSG2
        CALL READ
        MOV COL,AL
        MOV AH,00
        MOV AL,3
        INT 10H
        MOV AH,02
        MOV BH,00
        MOV DH,ROW
        MOV DL,COL
        INT 10H
        MOV AH,01H
        INT 21H
        MOV AH,4CH
        INT 21H
    READ PROC 
        MOV AH,01
        INT 21H
        AND AL,0FH
        MOV BL,AL
        MOV AH,01
        INT 21H
        AND AL,0FH
        MOV AH,BL
        AAD
        RET 
        READ ENDP
    END START
PRINT MACRO M
    MOV AH,09H
    MOV DX,OFFSET M
    INT 21H
ENDM
.MODEL SMALL
.STACK 64H
.DATA
    EMPTY DB 10,13, "  $"
    STR1 DB 25,?,25 DUP('$')
    STR2 DB 25,?,25 DUP('$')
    MSTRING DB 10,13, "ENTER THE STRING: $"
    MSTRING2 DB 10,13, "ENTER SECOND STRING: $"
    MCONCAT DB 10,13, "CONCATENATED STRING: $"
.CODE
START:
    MOV AX,@DATA
    MOV DS,AX
    PRINT MSTRING
    CALL ACCEPT_STRING  
    PRINT MSTRING2
    MOV AH,0AH
    LEA DX,STR2
    INT 21H
    MOV CL,STR1+1
    MOV SI,OFFSET STR1
    NEXT:  
        INC SI
        DEC CL
        JNZ NEXT
    INC SI
    INC SI
    MOV DI,OFFSET STR2
    INC DI
    INC DI
    MOV CL,STR2+1
    MOVE_NEXT:
        MOV AL,[DI]
        MOV [SI],AL
        INC SI
        INC DI
        DEC CL
        JNZ MOVE_NEXT
    PRINT MCONCAT
    PRINT STR1+2
    EXIT:
        MOV AH,4CH
        INT 21H
        ACCEPT PROC NEAR
        MOV AH,01
        INT 21H
    RET
    ACCEPT ENDP
    DISPLAY1 PROC NEAR
        MOV AL,BL
        MOV BL,AL
        AND AL,0F0H
        MOV CL,04
        ROL AL,CL
        CMP AL,09
        JBE NUMBER
        ADD AL,07
        NUMBER:  
            ADD AL,30H
            MOV DL,AL
            MOV AH,02
            INT 21H
            MOV AL,BL
            AND AL,00FH
            CMP AL,09
            JBE NUMBER2
            ADD AL,07
        NUMBER2:  
            ADD AL,30H
            MOV DL,AL
            MOV AH,02
            INT 21H
    RET
    DISPLAY1 ENDP
    ACCEPT_STRING PROC NEAR
        MOV AH,0AH
        MOV DX,OFFSET STR1 
        INT 21H
        RET
        ACCEPT_STRING ENDP
END START
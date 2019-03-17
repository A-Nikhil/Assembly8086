.MODEL SMALL
.STACK 64H
.DATA
    STR1 DB 0DH,0AH, 'ENTER THE STRING :- $'
    STR2 DB 0DH,0AH, 'YOUR REVERSED STRING IS :- $'
    nl DB 0dh,0ah,'$' 
.CODE
    START:
    MOV AX,@DATA
    MOV DS,AX
    DISP:
        LEA DX,STR1
        MOV AH,09H
        INT 21H
        MOV CL,00
        MOV AH,01H
    READ:
        INT 21H
        MOV BL,AL
        PUSH BX
        INC CX
        CMP AL,0DH
        JZ DISPLAY
        JMP READ
    DISPLAY:
        LEA DX,STR2
        MOV AH,09H
        INT 21H
        LEA DX, nl
        MOV AH,09h
        INT 21h
    ANS:
        MOV AH,02H
        POP BX
        MOV DL,BL
        INT 21H
        LOOP ANS
END  START
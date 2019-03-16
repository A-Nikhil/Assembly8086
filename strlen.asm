.MODEL SMALL
.DATA
    INSTR DB 20 DUP("$")
    MSG1 DB "LENGTH = $"
.CODE
    START:
        MOV AX, @DATA
        MOV DS, AX
        LEA SI, INSTR
        MOV AH, 0AH
        MOV DX, SI
        INT 21H
        MOV BL, INSTR + 1
        ADD BL, 30H
        ;NEWLINE
        MOV AH, 02H
        MOV DX, 0AH
        INT 21H
        MOV DX, 0DH
        INT 21H
        LEA DX, MSG1
        MOV AH, 09H
        INT 21H
        MOV AH, 02H
        MOV DL, BL
        INT 21H
    END START
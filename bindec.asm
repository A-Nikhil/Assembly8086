.MODEL SMALL
.STACK 64H
.DATA
    MSG1 DB 'ENTER AN 8 BIT BINARY : $'
    MSG2 DB 'CORRESPONDING DECIMAL : $'
    DECI DW ?
.CODE
    START:
        MOV AX, @DATA
        MOV DS, AX
        LEA DX, MSG1
        MOV AH, 09H
        INT 21H
        MOV SI, 4200H
        MOV AH, 01H
        MOV CX, 08H
        INPUT:
            INT 21H
            MOV [SI], AL
            INC SI
            LOOP INPUT
        MOV DL, 10
		MOV AH, 02H
		INT 21H
		MOV DL, 13
		MOV AH, 02H
		INT 21H
        LEA DX, MSG2
        MOV AH, 09H
        INT 21H
        MOV AX, 02H
        MOV CX, 07H
        MOV BX, 01H
        DEC SI
        CMP [SI], 31H
        JE ONE
        MOV AX, 0000H
        JMP RESUME
        ONE:
            MOV AX,0001H
        RESUME:
            MUL BX
            ADD DECI, AX
        MOV AX, 02H
        BINARY:
            DEC SI
            MUL BX
            MOV BX, AX
            CMP [SI], 31H
            JE ONEAG
            MOV AX, 0000H
            JMP RESUAG
            ONEAG:
                MOV AX, 00001H
            RESUAG:
                MUL BX
                ADD DECI, AX
                MOV AX, 02H
            LOOP BINARY
        MOV AX, DECI
        AAM
        ADD AX, 3030h
        PUSH AX
        MOV DL, AH
        MOV AH, 02h
        INT 21h
        POP DX
        MOV AH, 02h
        INT 21h
        END START
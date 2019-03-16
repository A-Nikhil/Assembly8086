.MODEL SMALL
.STACK 64H
.DATA
    BIN EQU 1011b
    BCD DW ?
    MSG1 DB 'ENTER NUMBER OF TIMES : $'
    MSG2 DB 'LEFT TO RIGHT : $'
    MSG3 DB 'RIGHT TO LEFT : $'
    COUNTER DB ?
.CODE
    START:
        MOV AX, @DATA
        MOV DS, AX
        MOV BX, BIN
        MOV AX, 0H
        MOV CX, 0H
        AGAIN0:
            CMP BX, 0H
            JZ ENDPRG
            DEC BX
            MOV AL, CL
            ADD AL, 01H
            DAA
            MOV CL, AL
            MOV AL, CH
            ADC AL, 00H
            DAA
            MOV CH, AL
            JMP AGAIN0
        ENDPRG:
            MOV BCD, CX
        MOV BX, 10d
        MOV AX, CX
        DIV BX
        MOV SI, 4200
        MOV BH, AL
        MOV BL, DL
        LEA DX, MSG1
        MOV AH, 09H
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV CL, AL
        SUB CL, 30H
        DISPLAY:
            MOV DL, 10
            MOV AH, 02H
            INT 21H
            MOV DL, 13
            MOV AH, 02H
            INT 21H
            LEA DX, MSG2
            MOV AH, 09H
            INT 21H
            MOV AX, BX
	        ADD AX, 3030h
	        PUSH AX
	        MOV DL, AH
	        MOV AH, 02h
	        INT 21h
	        POP DX
	        MOV AH, 02h
	        INT 21h
            MOV DL, 10
            MOV AH, 02H
            INT 21H
            MOV DL, 13
            MOV AH, 02H
            INT 21H
            LEA DX, MSG3
            MOV AH, 09H
            INT 21H
            MOV AH, BL
            MOV AL, BH
            ADD AX, 3030h
	        PUSH AX
	        MOV DL, AH
	        MOV AH, 02h
	        INT 21h
	        POP DX
	        MOV AH, 02h
	        INT 21h
            LOOP DISPLAY
    END START
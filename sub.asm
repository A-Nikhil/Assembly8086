.MODEL SMALL

.STACK 100H

.DATA 
	MSG DB "===SUBTRACTION OF TWO NUMBERS=== $" 
	PROMPT1 DB 0AH," ENTER A FIRST NUMBER:        $"
	PROMPT2 DB 0AH,"ENTER A SECOND NUMBER:        $"
	PROMPT3 DB 0AH,"               ANSWER:        $"
	NUM1    DB ?,'$'
	NUM2    DB ?,'$'

.CODE
	START:
		MOV AX,@DATA
		MOV DS,AX

		MOV AH,9
		LEA DX,MSG
		INT 21H

		MOV AH,9
		LEA DX,PROMPT1
		INT 21H

		MOV AH,1
		INT 21H
		SUB AL,30H
		MOV NUM1,AL

		MOV AH,9
		LEA DX,PROMPT2
		INT 21H

		MOV AH,1
		INT 21H
		SUB AL,30H
		MOV NUM2,AL

		MOV AH,9
		LEA DX,PROMPT3
		INT 21H

		MOV AL,NUM1
		SUB AL,NUM2
		ADD AL,30H

		MOV AH,2
		MOV DL,AL
		INT 21H

		MOV AH,4CH
		INT 21H

	END START

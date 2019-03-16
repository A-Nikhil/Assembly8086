.MODEL SMALL
.STACK 64H
.DATA
.CODE                                      
START: MOV BX, 00
REPEAT: PUSH BX
       MOV AH, 07H
       MOV AL, 00H
       MOV BH, 0FH
       MOV CX, 00H                                        
       MOV DH, 31H
       MOV DL, 79H
       INT 10H
       MOV AH, 02H
       MOV BH, 00H
       MOV DH, 0CH
       MOV DL, 25H
       INT 10H
       POP BX
       MOV AL, BL
       AAM
       ADD AX, 3030H
       MOV CX, AX
       MOV DL, AH
       MOV AH, 02H
       INT 21H
       MOV DL, CL  
       MOV AH, 02H
       INT 21H
       INC BL
       CMP BL, 100
       JNE REPEAT
       MOV AH, 0BH
       INT 21H
      CMP AL, 00H
      JE START 
      MOV AH, 4CH
      INT 21H
END START 
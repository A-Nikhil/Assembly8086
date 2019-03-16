.model small
.stack 100h
.data
  msg DB 'Enter a decimal number:$'
  msg1 DB 0dh,0ah,'Invalid id entry $'
  msg2 DB 0dh,0ah,'Its equiavalent binary is:$' 
.code
  main PROC
   MOV AX,@data
   MOV DS,AX
   LEA DX,msg
   MOV AH,9
   INT 21h
   MOV AH, 1
   INT 21H
   LEA DX,msg2
   MOV AH,9
   INT 21h
   AND AL,0fh 
   MOV CL,3  
   MOV BL,AL  
   MOV BH,BL  
   SHR BH,CL  
   ADD BH,30h 
   MOV AH,2  
   MOV DL,BH
   INT 21h
   XOR BH,BH
   MOV BH,BL  
   MOV CL,2 
   AND BH,04h 
   SHR BH,CL
   ADD BH,30h
   MOV AH,2   
   MOV DL,BH
   INT 21h
   XOR BH,BH
   MOV BH,BL
   AND BH,02h 
   SHR BH,1
   ADD BH,30h
   MOV AH,2   
   MOV DL,BH
   INT 21h
   XOR BH,BH
   MOV BH,BL  
   AND BH,01h 
   ADD BH,30h
   MOV AH,2  
   MOV DL,BH
   INT 21h
   JMP exit
   exit:
  MOV AH,4ch
  INT 21h
   main ENDP
      END main
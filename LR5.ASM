MYCODE SEGMENT 'CODE'     
	ASSUME CS:MYCODE, DS:MYCODE 

mes0 DB 13,10,'Enter string: $'
mes1 DB 13,10,'Press any key to restart... Press * to exit... $'
HEX_STRING DB '0123456789ABCDEF'
mystr db 256 dup(0) ;mystr db' $'
 
CLRF PROC  ;perevod stroki
	PUSH AX
	MOV AH, 02H      
	MOV DL, 0dh
	INT 21H 
	MOV AH, 02H      
	MOV DL, 0ah
	INT 21H 
	POP AX	
	RET
CLRF ENDP

GETCH PROC
	MOV AH, 01H  
	INT 21H 
	RET
GETCH ENDP

PUTCH PROC
	MOV AH, 02H      
	INT 21H 
	RET
PUTCH ENDP

CLRSCR PROC
	MOV AX, 03H
	INT 10H
	RET
CLRSCR ENDP

HEX PROC; procedura perevoda v 16 ss
    PUSH BX
	MOV BX, offset HEX_STRING
	MOV AX,DX
	PUSH AX
	SHR AL,4
	XLAT
	MOV DL,AL
	CALL PUTCH
	POP AX
	AND AL,00001111b
	XLAT
	MOV DL,AL
	CALL PUTCH
	POP BX
	RET
HEX ENDP;
	
START: 
; êóê∞ê≥ëÄëÉê∑ê∫ê∞ ëÅêµê≥êºêµêΩëÇêΩêæê≥êæ ëÄêµê≥ê∏ëÅëÇëÄê∞ ê¥ê∞êΩêΩëãëÖ ds     
	PUSH CS    
	POP  DS 
	CALL CLRSCR
	MOV DX, OFFSET mes0
	MOV AH, 09H
	INT 21H
	
	Loop0:
	CALL CLRSCR
	CALL CLRF
	LEA BX,mystr
	MOV BX,0
	 Loop1:
		 LoopCh:
		CALL GETCH
			CMP AL,21h
			JB LoopCh
		 MOV [BX],AL
		 CMP AL, '$'
		 JNE ENIF
	 	 JMP ENDEF
	 		ENIF:
		 		MOV DL,AL
	 		ENDEF:
		 		INC BX
				INC DI
		 		CMP AL,'$'
		 		JNE Loop1
		 		MOV DL, '='
		 		CALL PUTCH
		 		MOV BX, 0
	 Loop2:
		 MOV DL,[BX]
		 PUSH DX
		 CMP DL, '$'
	 	 JNE Hexing
	 	 JMP G1
	 		Hexing:
			 	CALL HEX
			 	INC BX
			 	;MOV DL, ' '
			 	;CALL PUTCH 
				MOV DL, 'H'
		 		CALL PUTCH
				PUSH BX
				PUSH AX
				PUSH CX
				MOV AH, 02H    
				MOV DL, 10
				INT 21H 
				MOV BX, 0
				ADD BX, DI
				SUB DI, 1
				MOV CX, BX
				LOOP5:
					MOV DL, ' '
					CALL PUTCH
				LOOP LOOP5 
				
				POP CX
				POP AX	
				POP BX
				
	 		G1:
	 	 		;POP DX
	 	 		CMP DL, '$'
	 	 		JNE Loop2
				
	CALL CLRF	 
	; êûê∂ê∏ê¥ê∞êΩê∏êµ ê∑ê∞ê≤êµëÄëàêµêΩê∏ëè êøëÄêæê≥ëÄê∞êºêºëã  
	MOV DX, OFFSET mes1
	MOV AH, 09H
	INT 21H	
	CALL GETCH
	CMP AL, '*'
		JE FIN		
	LOOP Loop0
	
FIN:
; êíëãëÖêæê¥ ê∏ê∑ êøëÄêæê≥ëÄê∞êºêºëã
	CALL CLRSCR      
	MOV AL, 0      
	MOV AH, 4CH      
	INT 21H 
MYCODE ENDS 
END START

MYCODE SEGMENT 'CODE'     
	ASSUME CS:MYCODE, DS:MYCODE 

NoStr DB 'No second param$'
YesStr DB 'Yes second param$'
ME DB 'Gusev'
mystr DB '                    $'
NCoolStr Db 'Error:First param not cool $'
CoolStr Db 'First param cool $'
CLR DB 0dh,0ah,'$'

CLRF PROC
	MOV DX, OFFSET CLR
	MOV AH, 09H
	INT 021H
	RET
CLRF ENDP

GETCH PROC
	MOV AH, 08H  
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

OUTSTR PROC
	MOV AH, 09H
	INT 021H
	RET
OUTSTR ENDP

	
START:    
	PUSH CS    
	POP  DS 
	CALL CLRSCR
	
	MOV CL,ES:[80h]
	CMP CL, 0 ;��� ��ࠬ��஢ - ��室��
	JNE good ;�᫨ ���� ��ࠬ���� 
	JMP FIN
	good:
		MOV DH,0
		PUSH CX
		SUB CL, 1
		MOV AL,1
		MOV	SI,82h ;������� ��ࠬ��஢
		mov BX, offset mystr
		circle:
			MOV DL, ES:[SI]
			MOV	[BX], DL
			CMP	DL,' '
			JNE loop1 ;�᫨ �� ࠢ��
			MOV DH ,1
			loop1:
				ADD BX,1
				ADD SI,1
				CMP DH,0
				JNE next ;�᫨ �� ࠢ��
				ADD AL,1
		next:
		LOOP circle
		
	PUSH DS 
	POP ES
	MOV CL, AL
	PUSH AX;ࠧ��� 1 ��ࠬ � �஡����
	SUB CL, 1
	MOV	SI,OFFSET ME
	MOV	DI,OFFSET mystr
	CMP CL, 5;����� �㪢 � 䠬����
	JNE err0r
	srav:         ;�ࠢ����� me c mystr ��ᨬ���쭮
		CMPSB 
		JNE err0r
	LOOP srav
	CMP CL,0
	JNE err0r
	
	MOV DX, OFFSET CoolStr
	CALL OUTSTR
	MOV DL,'='
	CALL PUTCH
	JMP yes
	err0r:
		MOV DX, OFFSET NCoolStr
		CALL OUTSTR
		MOV DL,'='
		CALL PUTCH
	yes:
		MOV BX, OFFSET mystr
	loop2:
		MOV DL,[BX]
		CMP DL,' '
		JE goaway
		CALL PUTCH
		ADD BX,1
	JMP loop2
	goaway:
		CALL CLRF
		POP AX
		POP CX
		CMP CL, AL ;cl-����� ��� ��ப� al-1 ��ࠬ
		JNE ok
		MOV DX, OFFSET NoStr
		CALL OUTSTR
		JMP nok
	ok:
		MOV DX, OFFSET YesStr
		CALL OUTSTR
	nok:
		CALL CLRF
		CALL GETCH
	
	FIN:;��室  
	MOV AL, 0      
	MOV AH, 4CH      
	INT 21H 
	
MYCODE ENDS 
END START














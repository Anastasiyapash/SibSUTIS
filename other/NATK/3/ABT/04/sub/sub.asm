; --------------------------------------------------
; ���⠭�� ASCII-�ᥫ
; --------------------------------------------------
		.MODEL SMALL
		.DATA
; --------------------------------------------------
ASCVALUE1	DB	  '548'			;ASCII-�᫠	
ASCVALUE2	DB	  '724'
message         DB	  '१���� ���⠭�� ','$'
ASCTOTAL	DB	  '0000','$'
.386  ; ---------------------------------------------
		.CODE
BEGIN:
ADDASCII	PROC   NEAR
		MOV	AX,@DATA                ;���樠������ DS
		MOV	DS,AX			;	�१ AX

		CLC				;���⪠ CF
		LEA	  SI,ASCVALUE1+2	;���樠������ ���ᮢ
		LEA	  DI,ASCVALUE2+2	;   ASCII-�ᥫ
		LEA	  BX,ASCTOTAL+3
		MOV	  CX,03			;���-�� ����७�� 横��
A20:
		MOVZX  AX,[DI]			;����㧨�� ASCII-���� � AX
		ADC	  AL,[SI]		;᫮���� � �������� ��७�ᮬ
		AAA				;᪮४�஢��� ᫮�����
		MOV	  [BX],AL		;��࠭��� �㬬�
		DEC	  SI
		DEC	  DI
		DEC	  BX
		LOOP   A20			;������� 3 ࠧ�
		MOV	  [BX],AH		;� ���� ��࠭��� ��������
						;	 ��७��
		LEA	  BX,ASCTOTAL+3		;���樠������ �८�ࠧ������
		MOV	  CX,04			;  �㬬� � ASCII �ଠ�
A30:
		OR	  BYTE PTR[BX],30H      ;�ନ஢���� ASCII-�᫠
		DEC	  BX
		LOOP   A30			;������� 4 ࠧ�
		mov	ah,09h
	        mov	dx,offset message
		int 	21h
		mov	ah,09h
		mov	dx,offset ASCTOTAL 
		int	21h
		MOV	  AX,4C00H		;�⠭���⭮� ���砭�� �ணࠬ��
		INT	  21H
		
ADDASCII	ENDP
		END	  BEGIN

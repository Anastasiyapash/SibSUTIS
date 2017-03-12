;---------------------------------------------------
; ������� ASCII-�����
;---------------------------------------------------
		.MODEL SMALL
		.DATA
;---------------------------------------------------
DIVIDEND	DB	  '3698'		;ASCII-�����
DIVISOR	DB	  '4'                           
ASCQUOT	DB	  4 DUP(0)
;---------------------------------------------------
		.CODE
BEGIN:	
DIVASCII	PROC   NEAR
		MOV	AX,@DATA                ;������������� DS
		MOV	DS,AX			;	����� AX
		MOV	ES,AX
							
		MOV	  CX,04			;���-�� ���������� �����
		SUB	  AH,AH			;������� ������ ����� ��������
		AND	  DIVISOR,0FH		;������� � �������� 3 � ASCII
		LEA	  SI,DIVIDEND           ;������������� �������
		LEA	  DI,ASCQUOT            ;	ASCII-�����
A20:
		LODSB	  			;��������� ASCII-���� � AL
		AND	  AL,0FH		;�������� 3 � ASCII
		AAD				;��������������� �����
						;	��������	
		DIV	  DIVISOR		�������
		STOSB	  			;��������� ���������
		LOOP   A20			;��������� 4 ����
						;������������� ��������� �
		LEA	  BX,ASCQUOT		;	ASCII-������ �������
						;	� ������ �����	
		MOV	  CX,04			;	4 ����  
A30:
		OR	  BYTE PTR[BX],30H	;������������ ASCII-�����
		INC	  BX			;��������� ����
		LOOP   A30			;��������� 4 ����

		MOV	  AX,4C00H		;����������� �������� ���������
		INT	  21H
DIVASCII	ENDP
		END	  BEGIN

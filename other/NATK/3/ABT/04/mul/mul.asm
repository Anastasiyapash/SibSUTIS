;--------------------------------------------
; ��������� ASCII-�����
;--------------------------------------------
		.MODEL SMALL
		.DATA
;--------------------------------------------
MULTCAND	DB	  '3783'		;ASCII-�����	
MULTPLER	DB	  '5'
ASCPROD	DB	  5 DUP(0)
;--------------------------------------------
		.CODE
BEGIN:	
MULASCII	PROC   NEAR			
		MOV	AX,@DATA                ;������������� DS
		MOV	DS,AX			;	����� AX

		MOV	  CX,04			;���-�� ���������� �����
		LEA	  SI,MULTCAND+3         ;������������� �������
		LEA	  DI,ASCPROD+4          ;	ASCII-�����
		AND	  MULTPLER,0FH		;������� 3 � ASCII-�����
A20:
		MOV	  AL,[SI]		;��������� ASCII-���� � AL
		AND	  AL,0FH		;������� 3 � ASCII-�����
		MUL	  MULTPLER		;��������
		AAM				;   ��������������� ���������
		ADD	  AL,[DI]		;������� � ����� ����������
						;   �����������
		AAA				;   ��������������� ��������
		MOV	  [DI],AL		;��������� ���������
		DEC	  DI                    
		MOV	  [DI],AH		;��������� ��������� ��������
		DEC	  SI
		LOOP	  A20			;��������� 4 ����

		LEA	  BX,ASCPROD+4		;������������� ��������� �
		                                ;	ASCII-������	
		MOV	  CX,05			;������ - ������ 5 ����	
A30:
		OR	  BYTE PTR[BX],30H      ;������������ ASCII-�����
		DEC	  BX
		LOOP   A30			;��������� 5 ���

		MOV	  AX,4C00H		;����������� �������� ���������
		INT	  21H
MULASCII	ENDP
		END	  BEGIN


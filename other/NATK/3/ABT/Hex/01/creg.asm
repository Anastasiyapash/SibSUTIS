;
; �८�ࠧ������ ���祭�� ॣ��� �� � ASCI-���
; ��室�� �����: ���祭�� � ��
; �������      : ASCI-���(�� 4-� ᨬ�����) �� ����� ॣ���� si
;
; ���ਬ��; ax=0acdfh �������='ACDF'
;
model small
.code
creg	proc 	far
	public	creg
push	cx                      ;��࠭���
push	dx
push	bx
                                                                ;�����
                                                                ;�ਬ�� 
	mov	cx,4            ;���-�� ����७��              
.loop:                                                          
	mov	dh,ah           ;��।��� ���� ��稭�� ᫥��	; ac
	and	dh,0f0h		;�뤥����� ������ ���㡠��     ; a0
	shr	dh,4            ;��ࠢ�������                   ; 0a
	cmp	dh,9            ;���祭�� > 9
	jg	.big            ;��
	or	dh,30h          ;ASCI-��� ��� ���祭�� 0..9
.cont:
	mov	[si],dh         ;��࠭���� १����          ;'A'
	shl	ax,4            ;᫥���騩 ���㡠��             ; cd
	inc	si              ;᫥���騩 ���� ��� १����
	loop	.loop
pop	bx
pop	dx
pop	cx                      ;����⠭�����
	retf
.big:                           ;���祭�� > 9, �.�. 10..15
	and	dh,07h          ;���祭�� - 10                  ;  2 
	dec	dh              ;㬥��襭�� �� 1                ;  1
	or	dh,40h          ;ASCI-��� ��� ���祭�� 10..15   ; 41='A'
	jmp	.cont
creg	endp
end
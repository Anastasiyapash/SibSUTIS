;---------Prg01_01.asm----------------------------------------------------------------------------
; �ਬ�� ������ ���祭�� ���� ����� ������� ᨬ����� � ��ப�
; ��室��� ��ப�:'abcd...' 
; �������	 :'da...'
;-----------------------------------------------------------------------------------------------------
masm
model small
;.stack 100h
.data
var1	db 	'������ ���� ��ப� > 2 ᨬ�����: ','$'
var2	db	13,10,'�� ��ப� �뤥���� ��� ᨬ����: $'
par	label	byte
max	db	79
fact	db	?
val	db	80 dup(0)
val2	db	0,0, '$'

.code
start:
	mov	ax,@data
	mov	ds,ax 
;----------------------------
; ��⠢��
	mov	ah,09h
	lea	dx,var1
	int	21h

	mov	ah,0ah
	lea	dx,par
	int	21h

;----------------------------   	; ah al
	mov	al,val+1
	mov 	val2,al
;	mov	al,val2
	mov 	val2+1,'0'
;----------------------------

	mov	ah,09h
	lea	dx,var2
	int	21h
jmp	exit

	xor	cx,cx
	mov 	cl,fact
	lea	si,val
	mov	ah,02h
.loop:
	mov	dl,[si]
	int	21h
	inc	si
	loop	.loop
exit:
	mov	ah,09h
	lea	dx,val2
	int	21h
;----------------------------
	mov	ax,4c00h
	int	21h
end	start


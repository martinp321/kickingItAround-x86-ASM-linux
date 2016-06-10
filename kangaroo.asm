	section .data
	Snippet db 1234

	section .text
	global main
main:
	nop
	mov eax, 5

doMore:	dec eax
	jmp doMore

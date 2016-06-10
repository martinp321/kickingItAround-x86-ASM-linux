;nasm -f elf64 -l test.lst test.asm
;gcc -m64 -o test test.o

	extern printf

	section .data
msg:	db "hello world", 0
fmt:	db "%s", 10, 0

	section .text

	global main

main:
	push rbp

	mov rdi, fmt
	mov rsi, msg
	mov rax, 0
	call printf

	pop rbp
	
	mov eax, 0FFFFFFFFFh
	mov ebx, 02Dh
	dec ebx
	inc eax


	mov eax, 5
doMore: dec eax
	jnz doMore

	mov rax,0
	ret

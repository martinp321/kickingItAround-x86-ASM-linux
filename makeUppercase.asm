section .bss
	Buff resb 1

section .data
	;SYSTEM CALLS
	SYS_EXIT	equ 1
	SYS_READ 	equ 3
	SYS_WRITE	equ 4

	STDIN 		equ 0
	STDOUT 		equ 1
	SIZE		equ 1

	LOWERCASE_A	equ 61h
	LOWERCASE_Z	equ 7Ah

	hDiffToMakeUpperCase	equ 20h

section .text
	global _start

_start: 
	nop 			; needed for debugger

;ssize_t sys_read(unsigned int fd, char * buf, size_t count)
Read:	mov eax, SYS_READ	; sys_read
	mov ebx, STDIN	        ; fd
	mov ecx, Buff		; buf
	mov edx, SIZE		; count
	int 80h

	cmp eax, 0		; check return value of sys_read
	je Exit			; if EOF, goto exit

;do the comparison here
        cmp byte [Buff], LOWERCASE_A	; is the char lower than chr(a)?
        jb Write			; if so, goto write

        cmp byte [Buff], LOWERCASE_Z	; is the char higher than chr(z)?
        ja Write			; if so, goto write

        ;sub byte [Buff], hDiffToMakeUpperCase   ; we're taking away 20h so that we can make the value upper case
	jmp Read			; otherwise, go back to read
	
;ssize_t sys_write(unsigned int fd, const char * buf, size_t count)
Write:  
	sub byte [Buff], hDiffToMakeUpperCase	; we're taking away 20h so that we can make the value upper case

	mov eax, SYS_WRITE      ; sys_write
        mov ebx, STDOUT         ; fd
        mov ecx, Buff           ; buf
        mov edx, SIZE           ; count
        int 80h
	
	jmp Read		; go back to top

; int sys_exit(int status)
Exit:	mov eax, SYS_EXIT	; sys_exit
	mov ebx, 0		; status 
	int 80h


section .data
	msg: db "Hello World in ASSEMBLY!",10;
	len: equ $-msg;
	namelength: equ 8  ;
	newline: equ 10   ;

section .bss
	name: resb 8   ;

section .text
	global _start;

_start:
	;; Print to stdout, file 1
    mov eax, 4;
    mov ebx, 1;
    mov ecx, msg;
    mov edx, len;
    int 80h;

	;; Read from stdin, file 0
    mov eax, 3;
    mov ebx, 0;
    mov ecx, name;
    mov edx, namelength;
    int 80h;

	;; return 0
    mov eax, 1;
    mov ebx, 0;
    mov ecx, 0 ;
    mov edx, 0 ;
    int 80h;


; Vincent Cozzo
; An Assembly program
; to implement the classic algorithm,
; the Euclidean algorithm,
; to calculate the GCD of two natural numbers.
; For now, this only works for two-digit numbers,
; because of how the numbers are stored.
; I hope to generalize this to arbitrary-length integers
section .data
    get_a: db "Please enter value of a: " ;
    get_b: db "Please enter value of b: " ;
    scan_len: equ $-get_b   ;
    newl: db 0x0A ; The HEX value for newline, abbreviated as newl
    print_msg: db "Their greatest common divisor appears to be: " ;
    print_len: equ $-print_msg   ;
    dbg_msg1: db " modulo " ;
    dbg_msg1_s: equ $-dbg_msg1 ;
    dbg_msg2: db " appears to be " ;
    dbg_msg2_s: equ $-dbg_msg2 ;

section .bss
    a: resb 4   ;
    b: resb 4   ;
    res: resb 4 ;

section .text
    global _start;

_start:
    ;; Print message to user, to get a
    mov rax, 4;
    mov rbx, 1;
    mov rcx, get_a;
    mov rdx, scan_len;
    int 80h;

    ;; Read value of a
    mov rax, 3;
    mov rbx, 0;
    mov rcx, a;
    mov rdx, 4;
    int 80h;

; NOTE:
; in general, we actually wish to clear out  / zero out
;  the last nonzero byte of the input.
; This is because I do not want to include the trailing
; \10 (newline) in the storage of the number.
; So the following routine should do just that.
; (Maybe for now, assume a and b are two-digit numbers)
    mov word [a+2], $0 ;

    ;; Print a, with newline
    mov rax, 4;
    mov rbx, 1;
    mov rcx, a;
    mov rdx, 2;
    int 80h;

    mov eax, 4;
    mov ebx, 1;
    mov ecx, newl;
    mov edx, 1;
    int 80h;

    ;; Now print message to user, to get back b
    mov rax, 4;
    mov rbx, 1;
    mov rcx, get_b;
    mov rdx, scan_len;
    int 80h;

    ;; Read value of b
    mov rax, 3;
    mov rbx, 0;
    mov rcx, b;
    mov rdx, 4;
    int 80h;

    mov word [b+2], $0 ;

    ;; Print b, with newline
    mov rax, 4;
    mov rbx, 1;
    mov rcx, b;
    mov rdx, 4;
    int 80h;

    mov eax, 4;
    mov ebx, 1;
    mov ecx, newl;
    mov edx, 1;
    int 80h;

    mov rdi, $0

; First, to convert each variable a and b
; from ASCII values
; to the actual integer values that were intended.
    mov rdx, $3
findize:
    mov rcx, [a+rdx]
    cmp rcx, $0
    jnz convert_a
    sub rdx, $1
    cmp rdx, $0
    jl fail
    jge findsize

; at this point rdx is acccurately pointing
; to the 1's place digit.
    

euclid:
    mov rax, a ;
    mov rbx, b ;
    call modulo
;    mov edx, ebx %% ecx ;
;    mov [res] = edx
;    mov rcx, rbx
;    mov rbx, rax

    ;; Print b, with newline
;    mov rax, 4;
;    mov rbx, 1;
;    mov rcx, b;
;    mov rdx, 4;
;    int 80h;

    sub rax, rdi ;
    cmp rax, 0 ;
    je end ;
#    mov rbx, rcx ;
#    mov rcx, rdx ;
    jmp euclid

end:

    mov rax, 4;
    mov rbx, 1;
    mov rcx, print_msg;
    mov rdx, print_len;
    int 80h;

    mov rax, 4;
    mov rbx, 1;
    mov rcx, a;
    mov rdx, 8;
    int 80h;

    mov rax, 4;
    mov rbx, 1;
    mov rcx, newl;
    mov rdx, 1;
    int 80h;

    ;; return 0
    mov rax, 1;
    mov rbx, 0;
    mov rcx, 0;
    mov rdx, 0;
    int 80h;

modulo:
    push rbp
    mov rbp, rsp

    mov rax, 4 ;
    mov rbx, 1 ;
    mov rcx, [a] ;
    mov rdx, 8 ;
    int 80h ;

    mov rax, 4;
    mov rbx, 1;
    mov rcx, dbg_msg1 ;
    mov rdx, dbg_msg1_s ;
    int 80h;

    mov rax, 4 ;
    mov rbx, 1 ;
    mov rcx, [b] ;
    mov rdx, 8 ;
    int 80h ;

    mov rax, a
    mov rbx, b

loop:
    sub rax, rbx
    sub rax, rbx
    cmp rax, $0
    jl negative
    cmp rax, $0
    jz end_loop
    jmp loop
negative:
    add rax, rbx
end_loop:
    mov rax, 4;
    mov rbx, 1;
    mov rcx, dbg_msg2 ;
    mov rdx, dbg_msg2_s ;
    int 80h;

    mov rax, 4;
    mov rbx, 1;
    mov rcx, [a] ;
    mov rdx, 8 ;
    int 80h;

    mov rax, 4;
    mov rbx, 1;
    mov rcx, newl;
    mov rdx, 1;
    int 80h;

    mov [a], rbx
    mov rax, [b]

    mov rsp, rbp
    pop rbp
    ret

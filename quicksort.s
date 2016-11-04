	.file	"quicksort.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"Please enter the number of values in the array: "
.LC1:
	.string	"%d"
	.align 8
.LC2:
	.string	"ERR - array size appears inconsistent.\n\n%d does not match the given %d.\n"
.LC3:
	.string	"Size = %d\n"
.LC4:
	.string	"Sorted array: ["
.LC5:
	.string	"%d, "
.LC6:
	.string	"%d]\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	cmpl	$1, -52(%rbp)
	jg	.L2
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	-44(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$10, %edi
	call	putchar
	movl	-44(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L3
.L4:
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	addl	$1, -40(%rbp)
.L3:
	movl	-44(%rbp), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L4
	jmp	.L5
.L2:
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-52(%rbp), %eax
	je	.L6
	movl	-44(%rbp), %eax
	movl	-52(%rbp), %edx
	leal	-2(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$-1, %eax
	jmp	.L12
.L6:
	movl	-44(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$2, -40(%rbp)
	jmp	.L8
.L9:
	movl	-40(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, (%rbx)
	addl	$1, -40(%rbp)
.L8:
	movl	-40(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L9
.L5:
	movl	-44(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	-44(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-44(%rbp), %eax
	movq	-32(%rbp), %rsi
	movl	%edx, %ecx
	movl	$0, %edx
	movl	%eax, %edi
	call	quicksort
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -40(%rbp)
	jmp	.L10
.L11:
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -40(%rbp)
.L10:
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cmpl	-40(%rbp), %eax
	jg	.L11
	movl	-44(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
.L12:
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L13
	call	__stack_chk_fail
.L13:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.globl	quicksort
	.type	quicksort, @function
quicksort:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -24(%rbp)
	movl	%ecx, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L16
	movl	-36(%rbp), %eax
	subl	-24(%rbp), %eax
	leal	1(%rax), %edx
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	partition
	movl	%eax, -4(%rbp)
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	leal	-1(%rax), %ecx
	movl	-24(%rbp), %edx
	movq	-32(%rbp), %rsi
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	quicksort
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	leal	1(%rax), %edi
	movl	-36(%rbp), %edx
	movq	-32(%rbp), %rsi
	movl	-20(%rbp), %eax
	movl	%edx, %ecx
	movl	%edi, %edx
	movl	%eax, %edi
	call	quicksort
.L16:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	quicksort, .-quicksort
	.globl	partition
	.type	partition, @function
partition:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	-28(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	movl	$-1, -16(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L18
.L20:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-8(%rbp), %eax
	jge	.L19
	addl	$1, -16(%rbp)
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
.L19:
	addl	$1, -12(%rbp)
.L18:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	cmpl	-12(%rbp), %eax
	jg	.L20
	addl	$1, -16(%rbp)
	movl	-28(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-16(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	partition, .-partition
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

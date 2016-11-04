	.file	"mergesort.c"
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
	subq	$72, %rsp
	.cfi_offset 3, -24
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	cmpl	$1, -68(%rbp)
	jg	.L2
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	-52(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$10, %edi
	call	putchar
	movl	-52(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -40(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L3
.L4:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	addl	$1, -48(%rbp)
.L3:
	movl	-52(%rbp), %eax
	cmpl	%eax, -48(%rbp)
	jl	.L4
	jmp	.L5
.L2:
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -52(%rbp)
	movl	-52(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	cmpl	-68(%rbp), %eax
	je	.L6
	movl	-52(%rbp), %eax
	movl	-68(%rbp), %edx
	leal	-2(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$-1, %eax
	jmp	.L14
.L6:
	movl	-52(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -40(%rbp)
	movl	$2, -48(%rbp)
	jmp	.L8
.L9:
	movl	-48(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, (%rbx)
	addl	$1, -48(%rbp)
.L8:
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L9
.L5:
	movl	-52(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L10
.L11:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -48(%rbp)
.L10:
	movl	-52(%rbp), %eax
	cmpl	%eax, -48(%rbp)
	jl	.L11
	movl	-52(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	-52(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-52(%rbp), %eax
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rsi
	movq	%rcx, %r8
	movl	%edx, %ecx
	movl	$0, %edx
	movl	%eax, %edi
	call	mergesort
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -48(%rbp)
	jmp	.L12
.L13:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -48(%rbp)
.L12:
	movl	-52(%rbp), %eax
	subl	$1, %eax
	cmpl	-48(%rbp), %eax
	jg	.L13
	movl	-52(%rbp), %eax
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
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
.L14:
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L15
	call	__stack_chk_fail
.L15:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.globl	mergesort
	.type	mergesort, @function
mergesort:
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
	movq	%r8, -48(%rbp)
	movl	-24(%rbp), %eax
	addl	$1, %eax
	cmpl	-36(%rbp), %eax
	jne	.L17
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-24(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-32(%rbp), %rax
	addq	%rsi, %rax
	movq	%rcx, %r8
	movl	$1, %ecx
	movl	$1, %esi
	movq	%rax, %rdi
	call	merge
	jmp	.L19
.L17:
	movl	-36(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L19
	movl	-36(%rbp), %eax
	subl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	leal	-1(%rax), %ecx
	movq	-48(%rbp), %rdi
	movl	-24(%rbp), %edx
	movq	-32(%rbp), %rsi
	movl	-20(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	call	mergesort
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	leal	(%rdx,%rax), %edi
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %edx
	movq	-32(%rbp), %rsi
	movl	-20(%rbp), %eax
	movq	%rcx, %r8
	movl	%edx, %ecx
	movl	%edi, %edx
	movl	%eax, %edi
	call	mergesort
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movl	-24(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rdi
	movl	-4(%rbp), %edx
	movl	-4(%rbp), %eax
	movq	%rcx, %r8
	movl	%edx, %ecx
	movq	%rsi, %rdx
	movl	%eax, %esi
	call	merge
.L19:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	mergesort, .-mergesort
	.globl	merge
	.type	merge, @function
merge:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -48(%rbp)
	movq	%r8, -64(%rbp)
	movl	-44(%rbp), %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L21
.L24:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L22
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -20(%rbp)
	jmp	.L21
.L22:
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -16(%rbp)
.L21:
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jge	.L23
	movl	-16(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jl	.L24
.L23:
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jne	.L25
	movl	-16(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jne	.L25
	movl	$0, -12(%rbp)
	jmp	.L26
.L27:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -12(%rbp)
.L26:
	movl	-44(%rbp), %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	cmpl	-12(%rbp), %eax
	jg	.L27
	jmp	.L20
.L25:
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jne	.L29
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L30
.L31:
	movl	-20(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -12(%rbp)
.L30:
	movl	-12(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jl	.L31
	jmp	.L32
.L29:
	movl	-16(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jne	.L32
	movl	-20(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L33
.L34:
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -12(%rbp)
.L33:
	movl	-12(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L34
.L32:
	movl	$0, -12(%rbp)
	jmp	.L35
.L36:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -12(%rbp)
.L35:
	movl	-44(%rbp), %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	cmpl	-12(%rbp), %eax
	jg	.L36
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	merge, .-merge
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

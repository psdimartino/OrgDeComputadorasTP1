	.file	"tp1.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.ascii	"common -h\nUsage:\ncommon -"
	.string	"h\ncommon -V\ncommon [options] M N\nOptions:\n-h, --help     Prints usage information.\n-V, --version  Prints version information.\n-o, --output   Path to output file.\n-d  --divisor  Just the divisor\n-m  --multiple Just the multiple\nExamples:\ncommon -o - 256 192"
	.text
	.globl	print_help
	.type	print_help, @function
print_help:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_help, .-print_help
	.section	.rodata
.LC1:
	.string	"version"
.LC2:
	.string	"help"
.LC3:
	.string	"output"
.LC4:
	.string	"divisor"
.LC5:
	.string	"multiple"
	.section	.data.rel.local,"aw"
	.align 32
	.type	long_options, @object
	.size	long_options, 192
long_options:
	.quad	.LC1
	.long	0
	.zero	4
	.quad	0
	.long	86
	.zero	4
	.quad	.LC2
	.long	0
	.zero	4
	.quad	0
	.long	104
	.zero	4
	.quad	.LC3
	.long	1
	.zero	4
	.quad	0
	.long	111
	.zero	4
	.quad	.LC4
	.long	0
	.zero	4
	.quad	0
	.long	100
	.zero	4
	.quad	.LC5
	.long	0
	.zero	4
	.quad	0
	.long	109
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.section	.rodata
.LC6:
	.string	"Error: No arguments. Usage:"
.LC7:
	.string	"Version 1.0.0"
	.align 8
.LC8:
	.string	"Error: Invalid argument/s. Usage:"
.LC9:
	.string	"Vho:dm"
	.align 8
.LC10:
	.string	"Error: Out of range. Use smaller numbers."
.LC11:
	.string	"%u\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, -32(%rbp)
	movq	$0, -16(%rbp)
	movb	$1, -35(%rbp)
	movb	$1, -34(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	cmpl	$1, -52(%rbp)
	jg	.L5
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	call	print_help
	movl	$1, %eax
	jmp	.L18
.L13:
	movsbl	-33(%rbp), %eax
	subl	$86, %eax
	cmpl	$25, %eax
	ja	.L6
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L8(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L8(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L8:
	.long	.L12-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L11-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L10-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L9-.L8
	.long	.L6-.L8
	.long	.L7-.L8
	.text
.L12:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L18
.L10:
	movl	$0, %eax
	call	print_help
	movl	$0, %eax
	jmp	.L18
.L7:
	movq	optarg(%rip), %rax
	movq	%rax, -16(%rbp)
	jmp	.L5
.L11:
	movb	$0, -34(%rbp)
	jmp	.L5
.L9:
	movb	$0, -35(%rbp)
	jmp	.L5
.L6:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	call	print_help
	movl	$1, %eax
	jmp	.L18
.L5:
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movl	-52(%rbp), %eax
	movq	%rdx, %r8
	leaq	long_options(%rip), %rcx
	leaq	.LC9(%rip), %rdx
	movl	%eax, %edi
	call	getopt_long@PLT
	movb	%al, -33(%rbp)
	cmpb	$-1, -33(%rbp)
	jne	.L13
	movl	-52(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-16(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -24(%rbp)
	cmpl	$-1, -24(%rbp)
	jne	.L14
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L18
.L14:
	movl	-52(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L15
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L18
.L15:
	cmpb	$0, -35(%rbp)
	je	.L16
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	mcd@PLT
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L16:
	cmpb	$0, -34(%rbp)
	je	.L17
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	mcm@PLT
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L17:
	movl	$0, %eax
.L18:
	movq	-8(%rbp), %rcx
	subq	%fs:40, %rcx
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits

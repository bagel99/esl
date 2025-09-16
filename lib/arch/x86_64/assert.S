	.text
	.file	"assert.esl"
	.globl	_assert
	.p2align	4, 0x90
	.type	_assert,@function
_assert:
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdx, %r14
	movq	%rsi, %rbx
	testq	%rdi, %rdi
	jne	.LBB0_2
	movl	$.LS.5, %edi
	callq	memlen1@PLT
	movl	$2, %edi
	movl	$.LS.5, %esi
	movq	%rax, %rdx
	callq	write@PLT
.LBB0_2:
	movl	$.LS.6, %edi
	callq	memlen1@PLT
	movl	$2, %edi
	movl	$.LS.6, %esi
	movq	%rax, %rdx
	callq	write@PLT
	testq	%r14, %r14
	je	.LBB0_6
	movl	$20, %edi
	movabsq	$-3689348814741910323, %rsi
	.p2align	4, 0x90
.LBB0_4:
	leaq	-1(%rdi), %rcx
	movq	%r14, %rax
	mulq	%rsi
	shrq	$3, %rdx
	leal	(%rdx,%rdx), %eax
	leal	(%rax,%rax,4), %eax
	movl	%r14d, %r8d
	subl	%eax, %r8d
	orb	$48, %r8b
	movb	%r8b, 3(%rsp,%rdi)
	cmpq	$9, %r14
	movq	%rcx, %rdi
	movq	%rdx, %r14
	ja	.LBB0_4
	jmp	.LBB0_5
.LBB0_6:
	movb	$48, 23(%rsp)
	movl	$19, %ecx
.LBB0_5:
	leaq	4(%rsp,%rcx), %rsi
	movl	$20, %edx
	subq	%rcx, %rdx
	movl	$2, %edi
	callq	write@PLT
	movl	$.LS.7, %edi
	callq	memlen1@PLT
	movl	$2, %edi
	movl	$.LS.7, %esi
	movq	%rax, %rdx
	callq	write@PLT
	movq	%rbx, %rdi
	callq	memlen1@PLT
	movl	$2, %edi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	write@PLT
	movl	$2, %edi
	movl	$.LS.2, %esi
	movl	$1, %edx
	callq	write@PLT
	movq	$-1, %rdi
	callq	exit@PLT
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	_assert, .Lfunc_end0-_assert

	.type	.LS.2,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.LS.2:
	.asciz	"\n"
	.size	.LS.2, 2

	.type	.LS.5,@object
.LS.5:
	.asciz	"assert failed"
	.size	.LS.5, 14

	.type	.LS.6,@object
.LS.6:
	.asciz	" at line "
	.size	.LS.6, 10

	.type	.LS.7,@object
.LS.7:
	.asciz	" in file "
	.size	.LS.7, 10

	.section	".note.GNU-stack","",@progbits

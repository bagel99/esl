	.text
	.file	"sqrti8.esl"
	.globl	sqrti8
	.p2align	4, 0x90
	.type	sqrti8,@function
sqrti8:
	movabsq	$4611686018427387904, %rdx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movq	%rdx, %rsi
	.p2align	4, 0x90
.LBB0_1:
	movq	%rax, %r8
	orq	%rdx, %r8
	movq	%rax, %r9
	shrq	%r9
	cmpq	%r8, %rdi
	cmovbq	%rcx, %r8
	movq	%rdx, %rax
	cmovbq	%rcx, %rax
	subq	%r8, %rdi
	orq	%r9, %rax
	shrq	$2, %rsi
	cmpq	$3, %rdx
	movq	%rsi, %rdx
	ja	.LBB0_1
	retq
.Lfunc_end0:
	.size	sqrti8, .Lfunc_end0-sqrti8

	.section	".note.GNU-stack","",@progbits

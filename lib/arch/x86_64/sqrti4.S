	.text
	.file	"sqrti4.esl"
	.globl	sqrti4
	.p2align	4, 0x90
	.type	sqrti4,@function
sqrti4:
	xorl	%ecx, %ecx
	movl	$1073741824, %edx
	xorl	%eax, %eax
	movl	$1073741824, %esi
	.p2align	4, 0x90
.LBB0_1:
	movl	%eax, %r8d
	orl	%edx, %r8d
	movl	%eax, %r9d
	shrl	%r9d
	cmpl	%r8d, %edi
	cmovbl	%ecx, %r8d
	movl	%edx, %eax
	cmovbl	%ecx, %eax
	subl	%r8d, %edi
	orl	%r9d, %eax
	shrl	$2, %esi
	cmpl	$3, %edx
	movl	%esi, %edx
	ja	.LBB0_1
	retq
.Lfunc_end0:
	.size	sqrti4, .Lfunc_end0-sqrti4

	.section	".note.GNU-stack","",@progbits

	.text
	.file	"sqrti2.esl"
	.globl	sqrti2
	.p2align	4, 0x90
	.type	sqrti2,@function
sqrti2:
	movw	$16384, %dx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_1:
	movzwl	%ax, %esi
	orl	%edx, %eax
	movzwl	%dx, %r8d
	shrl	%esi
	movzwl	%ax, %eax
	cmpl	%eax, %edi
	cmovbl	%ecx, %eax
	cmovbl	%ecx, %edx
	subl	%eax, %edi
	orl	%esi, %edx
	movl	%edx, %eax
	movl	%r8d, %edx
	shrl	$2, %edx
	cmpw	$3, %r8w
	ja	.LBB0_1
	retq
.Lfunc_end0:
	.size	sqrti2, .Lfunc_end0-sqrti2

	.section	".note.GNU-stack","",@progbits

	.globl	memlen1
	.globl	memlen2
	.globl	memlen4
	.globl	memlen8
memlen1:
memlen2:
memlen4:
memlen8:
	movq	$-1,%rax
0:	incq	%rax
	cmpb	$0,(%rdi)
	leaq	1(%rdi),%rdi
	jne	0b
	ret	


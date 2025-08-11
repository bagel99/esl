	.text
	.globl	memalloc
memalloc:
	jmp	malloc

	.globl	memfree
memfree:
	jmp	free


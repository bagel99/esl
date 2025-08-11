// Really stupid implementations of memcpy
	.align	2
	.globl	memcpy
memcpy:
	cmp	x2,#0
	b.eq	9f
0:	ldrb	w3,[x1],#1
	strb	w3,[x0],#1
	subs	x2,x2,#1
	b.ne	0b
9:	ret


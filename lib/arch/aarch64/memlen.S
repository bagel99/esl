// Really stupid implementations of memlen
	.align	2
	.globl	memlen
	.globl	memlen1
memlen:
memlen1:
	cmp	x0,#0
	b.eq	9f
	mov	x1,x0
0:	ldrb	w3,[x0],#1
	cmp	w3,#0
	b.ne	0b
	subs	x0,x0,#1
	subs	x0,x0,x1
9:	ret


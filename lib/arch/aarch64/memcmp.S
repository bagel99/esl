// Really stupid implementations of memcmp
	.align	2
	.globl	memcmp
	.globl	memcmp1
memcmp:
memcmp1:
	cmp	x2,#0
	b.eq	9f
0:	ldrb	w3,[x0],#1
	ldrb	w4,[x1],#1
	cmp	w3,w4
	b.ne	8f
	subs	x2,x2,#1
	b.ne	0b
9:	mov	x0,#1
	ret
8:	mov	x0,#0
	ret


// Really stupid implementations of memset
	.align	2
	.globl	memset
memset:
	cmp	x2,#0
	b.eq	9f
0:	strb	w1,[x0],#1
	subs	x2,x2,#1
	b.ne	0b
9:	ret


	.file	"memcmp.c"
	.text
	.align	16, 0x90
	.globl	memcmp1
	.type	memcmp1,@function
memcmp1:
	testl	%edx, %edx
	je	.L1_i8
	xorl	%eax, %eax		# assume failure
.LOOP_i8:
	movb	(%rdi), %cl
	cmpb	(%rsi), %cl
	jne	.LRET_i8
	incq	%rsi
	incq	%rdi
	decl	%edx
	jne	.LOOP_i8
.L1_i8:
	movl	$1, %eax
.LRET_i8:
	ret
	.size	memcmp1, .-memcmp1



	.align	16, 0x90
	.globl	memcmp2
	.type	memcmp2,@function
memcmp2:
	testl	%edx, %edx
	je	.L1_i16
	xorl	%eax, %eax		# assume failure
.LOOP_i16:
	movw	(%rdi), %cx
	cmpw	(%rsi), %cx
	jne	.LRET_i16
	addq	$2, %rsi
	addq	$2, %rdi
	decl	%edx
	jne	.LOOP_i16
.L1_i16:
	movl	$1, %eax
.LRET_i16:
	ret
	.size	memcmp2, .-memcmp2



	.align	16, 0x90
	.globl	memcmp4
	.type	memcmp4,@function
memcmp4:
	testl	%edx, %edx
	je	.L1_i32
	xorl	%eax, %eax		# assume failure
.LOOP_i32:
	movl	(%rdi), %ecx
	cmpl	(%rsi), %ecx
	jne	.LRET_i32
	addq	$4, %rsi
	addq	$4, %rdi
	decl	%edx
	jne	.LOOP_i32
.L1_i32:
	movl	$1, %eax
.LRET_i32:
	ret
	.size	memcmp4, .-memcmp4



	.align	16, 0x90
	.globl	memcmp8
	.type	memcmp_i64,@function
memcmp8:
	testl	%edx, %edx
	je	.L1_i64
	xorl	%eax, %eax		# assume failure
.LOOP_i64:
	movq	(%rdi), %rcx
	cmpq	(%rsi), %rcx
	jne	.LRET_i64
	addq	$8, %rsi
	addq	$8, %rdi
	decl	%edx
	jne	.LOOP_i64
.L1_i64:
	movl	$1, %eax
.LRET_i64:
	ret
	.size	memcmp8, .-memcmp8


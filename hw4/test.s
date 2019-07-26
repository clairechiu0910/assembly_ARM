	.file	"test.c"
	.section	.rodata
	.align	2
.LC0:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.align	2
.LC1:
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.align	2
.LC2:
	.word	1
	.word	2
	.word	3
	.word	4
	.align	2
.LC3:
	.ascii	"%d \000"
	.align	2
.LC4:
	.ascii	"\n\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 92
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #92
	ldr	r3, .L38
	sub	lr, fp, #36
	mov	ip, r3
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	stmia	lr, {r0, r1}
	ldr	r3, .L38+4
	sub	lr, fp, #60
	mov	ip, r3
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	stmia	lr, {r0, r1}
	sub	r3, fp, #76
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L38+8
	sub	ip, fp, #92
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r3, #0
	str	r3, [fp, #-96]
.L2:
	ldr	r3, [fp, #-96]
	cmp	r3, #1
	ble	.L5
	b	.L3
.L5:
	mov	r3, #0
	str	r3, [fp, #-100]
.L6:
	ldr	r3, [fp, #-100]
	cmp	r3, #1
	ble	.L9
	b	.L4
.L9:
	mov	r3, #0
	str	r3, [fp, #-104]
.L10:
	ldr	r3, [fp, #-104]
	cmp	r3, #2
	ble	.L13
	b	.L8
.L13:
	ldr	r3, [fp, #-96]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	mvn	r2, #63
	mov	r3, r3, asl #2
	sub	r1, fp, #12
	add	r3, r3, r1
	add	r0, r3, r2
	ldr	r3, [fp, #-96]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	mvn	r2, #63
	mov	r3, r3, asl #2
	sub	ip, fp, #12
	add	r3, r3, ip
	add	ip, r3, r2
	ldr	r2, [fp, #-96]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	ldr	r2, [fp, #-104]
	add	r3, r3, r2
	mvn	r2, #23
	mov	r3, r3, asl #2
	sub	lr, fp, #12
	add	r3, r3, lr
	add	r1, r3, r2
	ldr	r3, [fp, #-104]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	mvn	r2, #47
	mov	r3, r3, asl #2
	sub	lr, fp, #12
	add	r3, r3, lr
	add	r3, r3, r2
	ldr	r2, [r1, #0]
	ldr	r3, [r3, #0]
	mul	r2, r3, r2
	ldr	r3, [ip, #0]
	add	r3, r3, r2
	str	r3, [r0, #0]
	ldr	r3, [fp, #-104]
	add	r3, r3, #1
	str	r3, [fp, #-104]
	b	.L10
.L8:
	ldr	r3, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-100]
	b	.L6
.L4:
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	b	.L2
.L3:
	mov	r3, #0
	str	r3, [fp, #-96]
.L14:
	ldr	r3, [fp, #-96]
	cmp	r3, #1
	ble	.L17
	b	.L15
.L17:
	mov	r3, #0
	str	r3, [fp, #-100]
.L18:
	ldr	r3, [fp, #-100]
	cmp	r3, #1
	ble	.L21
	b	.L19
.L21:
	ldr	r3, [fp, #-96]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	mvn	r2, #63
	mov	r3, r3, asl #2
	sub	r1, fp, #12
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r0, .L38+12
	ldr	r1, [r3, #0]
	bl	printf
	ldr	r3, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-100]
	b	.L18
.L19:
	ldr	r0, .L38+16
	bl	printf
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	b	.L14
.L15:
	mov	r3, #0
	str	r3, [fp, #-96]
.L22:
	ldr	r3, [fp, #-96]
	cmp	r3, #1
	ble	.L25
	b	.L23
.L25:
	mov	r3, #0
	str	r3, [fp, #-100]
.L26:
	ldr	r3, [fp, #-100]
	cmp	r3, #1
	ble	.L29
	b	.L24
.L29:
	ldr	r3, [fp, #-96]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	mvn	r2, #63
	mov	r3, r3, asl #2
	sub	ip, fp, #12
	add	r3, r3, ip
	add	r0, r3, r2
	ldr	r3, [fp, #-96]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	mvn	r2, #63
	mov	r3, r3, asl #2
	sub	lr, fp, #12
	add	r3, r3, lr
	add	r1, r3, r2
	ldr	r3, [fp, #-96]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	mvn	r2, #79
	mov	r3, r3, asl #2
	sub	ip, fp, #12
	add	r3, r3, ip
	add	r3, r3, r2
	ldr	r2, [r1, #0]
	ldr	r3, [r3, #0]
	add	r3, r2, r3
	str	r3, [r0, #0]
	ldr	r3, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-100]
	b	.L26
.L24:
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	b	.L22
.L23:
	mov	r3, #0
	str	r3, [fp, #-96]
.L30:
	ldr	r3, [fp, #-96]
	cmp	r3, #1
	ble	.L33
	b	.L31
.L33:
	mov	r3, #0
	str	r3, [fp, #-100]
.L34:
	ldr	r3, [fp, #-100]
	cmp	r3, #1
	ble	.L37
	b	.L35
.L37:
	ldr	r3, [fp, #-96]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	mvn	r2, #63
	mov	r3, r3, asl #2
	sub	lr, fp, #12
	add	r3, r3, lr
	add	r3, r3, r2
	ldr	r0, .L38+12
	ldr	r1, [r3, #0]
	bl	printf
	ldr	r3, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-100]
	b	.L34
.L35:
	ldr	r0, .L38+16
	bl	printf
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	b	.L30
.L31:
	mov	r3, #0
	mov	r0, r3
	ldmea	fp, {fp, sp, pc}
.L39:
	.align	2
.L38:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.6"

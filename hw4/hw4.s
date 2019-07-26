/* ========================= */
/*       DATA section        */
/* ========================= */
	.data 
	.align 4

/*---variable a 2*3matrix---*/
	.type a, %object
	.size a, 24
a:
	.word 1
	.word 2
	.word 3
	.word 4
	.word 5
	.word 6

/*---variable b 3*2matrix---*/
	.type b, %object
	.size b, 24
b:
	.word 7
	.word 8
	.word 9
	.word 10
	.word 11
	.word 12

/*---  space c 2*2matrix ---*/
	.type c, %object
	.size c, 16
c:
	.word 0
	.word 0
	.word 0
	.word 0

/*---variable d 2*2matrix---*/
	.type d, %object
	.size d, 16
d:
	.word 1
	.word 2
	.word 3
	.word 4

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main, %function
.matrix:
	.word a			@a[2][3] 24byte
	.word b			@b[3][2] 24byte
	.word c			@c[2][2] 16byte
	.word d			@d[2][2] 16byte
main:
	/*c=c+d*/
	mov r0, #0		@r0=i=0
loop1:
	cmp r0, #2		@i<2?
	bge exit1		@if i>=2 finish

	mov r1, #0		@r1=j=0
loop2:
	cmp r1, #2		@j<2?
	bge exit2		@if j>=2 finish

	mov r3, #0		@r3=k=0
loop3:
	cmp r3, #3		@k<3?
	bge exit3

	ldr r4, .matrix		@r4=.word a
	ldr r5, .matrix +4	@r5=.word b
	ldr r6, .matrix +8	@r6=.word c
	
	add r7, r0, r0, lsl #1	@r7=r0(i)*3(1+2)
	add r4, r4, r7, lsl #2	@r4=word a + r0(i)*3*4
	add r4, r4, r3, lsl #2	@r4=word a + r0(i)*3*4 + r3(k)*4
	ldr r4, [r4]

	add r5, r5, r3, lsl #3	@r5=.word b + r3(k)*2*4
	add r5, r5, r1, lsl #2	@r5=.word b + r3(k)*3*4 + r1(j)*4
	ldr r5, [r5]
	
	add r6, r6, r0, lsl #3	@r6=.word c + r0(i)*2*4
	add r6, r6, r1, lsl #2	@r6=.word c + r0(i)*2*4 + r1(k)*4
	ldr r2, [r6]

	mul r7, r4, r5
	add r2, r2, r7
	str r2, [r6]

	add r3, r3, #1		@k++
	b loop3
exit3:
	add r1, r1, #1		@j++
	b loop2		
exit2:
	add r0, r0, #1		@i++
	b loop1
exit1:	

	/*c=c+d*/
	mov r0, #0		@r0=i=0
loop4:
	cmp r0, #2		@i<2?
	bge exit4		@if i>=2 finish

	mov r1, #0		@r1=j=0
loop5:
	cmp r1, #2		@j<2?
	bge exit5		@if j>=2 finish

	ldr r3, .matrix +8	@r3=.word c
	ldr r4, .matrix +12	@r4=.word d
	add r3, r3, r0, lsl #3	@r3=.word c + r0(i)*2*4
	add r3, r3, r1, lsl #2	@r3=.word c + r0(i)*2*4 + r1(j)*4
	ldr r5, [r3]
	add r4, r4, r0, lsl #3
	add r4, r4, r1, lsl #2
	ldr r4, [r4]
	add r6, r5, r4
	str r6, [r3]

	add r1, r1, #1		@j++
	b loop5	
	
exit5:
	add r0, r0, #1		@i++
	b loop4
exit4:	
	ldr r1, .matrix +8	@r1 point to matrix c
	nop
	.end 			@c=d+a*b

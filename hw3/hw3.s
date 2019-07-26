	.section .text
	.global main
	.type main, %function
main:
	mov r0, #-100		@r0=a num
	mov r1, #-1		@r1=-1
	cmp r0, #0
	mullt r2, r0, r1	@if(r0 < #0) r2=r0*r1(-1)
	movge r2, r0		@if(r0 >= #0) r2=r0
	nop
	.end

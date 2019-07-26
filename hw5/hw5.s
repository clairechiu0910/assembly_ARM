/* ============================= */
/*          TEXT section         */
/* ============================= */
	.section .text
	.global main
	.type main, %function
main:
	mov r0, #40		@r0=a
	mov r1, #48		@r1=b
loop:
	cmp r0, r1
	beq exit		@if(r0==r1) exit
	
	subgt r0, r0, r1	@if(r0>r1) r0=r0-r1
	suble r1, r1, r0	@if(r0<r1) r1=r1-r0
	
	b loop
exit:
	nop
	.end 			@r0=gdb(r0,r1)

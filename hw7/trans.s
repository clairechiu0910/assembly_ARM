	.section .text
	.global trans
	.type trans, %function
trans:
	mov ip, sp
	stmfd sp!, {fp, ip, lr, pc}
	sub fp, ip, #4
	
	/*r0=argument, return value*/
	cmp r0, #0x61  /* 0x61=a */
	ble lable
	cmpge r0, #0x7A  /* 0x7A=z, if(r0>=0x61)cmp */
	suble r0, r0, #0x20  /* if(r0<=0x7A) sub */
	b lable
lable:
	ldmea fp, {fp, sp, pc}

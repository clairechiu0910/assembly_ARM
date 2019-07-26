.set SWI_Open, 0x1
.set SWI_Close, 0x2
.set SWI_WriteC, 0x3
.set SWI_Write, 0x5
.set SWI_Read, 0x6
.set SWI_FLen, 0xC
.set AngelSWI, 0x123456


/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- a string --- */
.filename_addr_input:
	.ascii "input.txt\000"
.filename_addr_output:
	.ascii "output.txt\000"
.readbuffer:
	.space 4

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function
.filename:
.word .filename_addr_input
	.word .filename_addr_output
.open_param_input:
	.word .filename_addr_input
	.word 0x2	@read 0x2
	.word 0x9	@length of filename
.flen_param_input:
	.space 4	@file descriptor
.read_param_input:
	.space 4	@file descriptor
	.word .readbuffer	@address of the read buffer
	.space 4	@# of bytes to be read
.close_param_input:
	.space 4	@file descriptor
.open_param_output:
	.word .filename_addr_output
	.word 0x4	@write 0x4
	.word 0x10	@length of filename
.write_param_output:
	.space 4	@file descriptor
	.space 4	@address of the string
	.space 4	@length of the string
.close_param_output:
	.space 4	@file descriptor
.char:
	.space 4	@char buffer

main:
	mov ip, sp
	stmfd sp!, {fp, ip, lr, pc}
	sub fp, ip, #4

        /* open input file */
	mov r0, #SWI_Open
	adr r1, .open_param_input
	swi AngelSWI
	mov r2, r0                /* r2 is file descriptor of input*/

	/* open output file*/
	mov r0, #SWI_Open
	adr r1, .open_param_output
	swi AngelSWI
	mov r3, r0		/* r3 is file descriptor of output*/

	/* get length of a input file */
	mov r0, #SWI_FLen
	adr r1, .flen_param_input
	str r2, [r1, #0]	/* store file descriptor */
	swi AngelSWI
	mov r6, r0		/* r6=r0=length of a input file*/
      
        /* read from a input file */
	adr r1, .read_param_input
	str r2, [r1, #0]          /* store file descriptor */
	ldr r5, [r1, #4]          /* r5 is the address of readbuffer */
	mov r7, #1
	str r7, [r1, #8]          /* store the length of the string */

loop:
	cmp r6, #1
	adr r1, .read_param_input
	mov r0, #SWI_Read
	swi AngelSWI
	ldr r5, [r1, #4]
	ldrb r4, [r5, #0]         /* r4 is the read data */

	/*toupper*/
	cmp r4,	#0x61 	/*0x41=a*/
	ble write /*if(r4<0x61) write*/
	cmpge r4, #0x7A  /*0x7A=z, if(r4>=0x61)cmp*/
	suble r4, r4, #0x20	/*if(r4<=0x7A)sub*/
	b write
write:	
	/* write r4 to .char*/
	adr r1, .char
	str r4, [r1, #0]

	/* write r4(.char) to output file*/
	adr r1, .write_param_output
	str r3, [r1, #0]	/*store file descriptor*/
	
	adr r5, .char
	str r5, [r1, #4]	/*store the address of char*/
	
	mov r5, #4
	str r5, [r1, #8]	/*store the length of the char*/
	
	mov r0, #SWI_Write
	swi AngelSWI
		
	cmp r6, #1
	sub r6, r6, #1
	bne loop

	/* close input file */
	adr r1, .close_param_input
	str r2, [r1, #0]
	mov r0, #SWI_Close
	swi AngelSWI

	/* close output file*/
	adr r1, .close_param_output
	str r2,[r1, #0]
	mov r1, #SWI_Close
	swi AngelSWI

	ldmea fp, {fp, sp, pc}


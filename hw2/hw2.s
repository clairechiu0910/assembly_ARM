/*=============================*/
/*    HW2: r7 = r0 +...+r4     */
/*=============================*/

	.section  .text
	.global main
	.type main, %function
main:
	add r8, r0, r1	@r8 := r0 + r1
	add r9, r2, r3  @r9 := r2 + r3
	add r7, r8, r9	@r7 := r8 + r9
	add r7, r7, r4	@r7 := r7 + r4
	nop
	.end

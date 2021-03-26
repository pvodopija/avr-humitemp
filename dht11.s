	.file	"dht11.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	iDhtRead
	.type	iDhtRead, @function
iDhtRead:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r30,r24
	ldd r18,Z+1
	ldi r24,lo8(1)
	ldi r25,0
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r22
	brpl 1b
	or r18,r24
	std Z+1,r18
	ldd r19,Z+2
	mov r18,r24
	com r18
	and r19,r18
	std Z+2,r19
	ldi r19,lo8(63999)
	ldi r20,hi8(63999)
	ldi r21,hlo8(63999)
1:	subi r19,1
	sbci r20,0
	sbci r21,0
	brne 1b
	rjmp .
	nop
	ldd r19,Z+2
	or r19,r24
	std Z+2,r19
	ldi r22,lo8(-96)
1:	dec r22
	brne 1b
	ldd r19,Z+1
	and r18,r19
	std Z+1,r18
	ldi r20,lo8(92)
.L2:
	ld r18,Z
	ldi r19,0
	and r18,r24
	and r19,r25
	or r18,r19
	brne .L29
	subi r20,lo8(-(-1))
	brne .L3
.L7:
	ldi r24,lo8(-2)
	rjmp .L4
.L3:
	ldi r18,lo8(5)
1:	dec r18
	brne 1b
	nop
	rjmp .L2
.L29:
	ldi r20,lo8(92)
.L6:
	ld r18,Z
	ldi r19,0
	and r18,r24
	and r19,r25
	or r18,r19
	breq .L30
	subi r20,lo8(-(-1))
	breq .L7
	ldi r19,lo8(5)
1:	dec r19
	brne 1b
	nop
	rjmp .L6
.L30:
	ldi r26,lo8(xDhtData)
	ldi r27,hi8(xDhtData)
	ldi r16,lo8(xDhtData+5)
	ldi r17,hi8(xDhtData+5)
	ldi r28,lo8(1)
	ldi r29,0
.L9:
	ldi r20,lo8(7)
	ldi r21,0
	ldi r18,0
.L20:
	ldi r19,lo8(57)
.L18:
	ld r22,Z
	ldi r23,0
	and r22,r24
	and r23,r25
	or r22,r23
	brne .L31
	subi r19,lo8(-(-1))
	brne .L10
.L13:
	ldi r24,lo8(-3)
	rjmp .L4
.L10:
	ldi r22,lo8(5)
1:	dec r22
	brne 1b
	nop
	rjmp .L18
.L31:
	ldi r19,0
.L12:
	ld r22,Z
	ldi r23,0
	and r22,r24
	and r23,r25
	or r22,r23
	breq .L32
	cpi r19,lo8(81)
	breq .L13
	ldi r22,lo8(5)
1:	dec r22
	brne 1b
	nop
	subi r19,lo8(-(1))
	rjmp .L12
.L32:
	movw r22,r28
	mov r0,r20
	rjmp 2f
	1:
	lsl r22
	2:
	dec r0
	brpl 1b
	cpi r19,lo8(30)
	brsh .L15
	com r22
	and r18,r22
	rjmp .L16
.L15:
	or r18,r22
.L16:
	subi r20,1
	sbc r21,__zero_reg__
	brcc .L20
	st X+,r18
	cp r16,r26
	cpc r17,r27
	brne .L9
	lds r18,xDhtData+1
	lds r24,xDhtData
	ldi r25,0
	add r24,r18
	adc r25,__zero_reg__
	lds r18,xDhtData+3
	add r24,r18
	adc r25,__zero_reg__
	lds r18,xDhtData+2
	add r24,r18
	adc r25,__zero_reg__
	lds r18,xDhtData+4
	ldi r19,0
	cp r24,r18
	cpc r25,r19
	brne .L21
	ldi r24,0
	rjmp .L4
.L21:
	ldi r24,lo8(-4)
.L4:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	iDhtRead, .-iDhtRead
	.comm	xDhtData,5,1
	.ident	"GCC: (GNU) 5.4.0"
.global __do_clear_bss

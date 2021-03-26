	.file	"lcd.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	vLcdPrintChar, @function
vLcdPrintChar:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0xb,__zero_reg__
	cpi r24,lo8(10)
	brne .L2
	in r24,0xb
	out 0xb,r24
	in r24,0x5
	andi r24,lo8(-4)
	out 0x5,r24
	ldi r20,lo8(-64)
	ldi r21,0
/* #APP */
 ;  62 "./drivers/lcd.h" 1
	swap r20                 
	lsr r20                  
	lsr r20                  
	in r18, 5              
	or r20, r18              
	out 5, r20              
	
 ;  0 "" 2
 ;  62 "./drivers/lcd.h" 1
	cbi 5, 2;
 ;  0 "" 2
/* #NOAPP */
	rjmp .L4
.L2:
	in r25,0xb
	ldi r20,lo8(4)
	mul r24,r20
	movw r18,r0
	clr __zero_reg__
	or r18,r25
	out 0xb,r18
	in r25,0x5
	andi r25,lo8(-4)
	out 0x5,r25
	andi r24,lo8(-64)
	mov r20,r24
	ldi r21,0
/* #APP */
 ;  62 "./drivers/lcd.h" 1
	swap r20                 
	lsr r20                  
	lsr r20                  
	in r18, 5              
	or r20, r18              
	out 5, r20              
	
 ;  0 "" 2
 ;  62 "./drivers/lcd.h" 1
	sbi 5, 2;
 ;  0 "" 2
/* #NOAPP */
.L4:
/* #APP */
 ;  62 "./drivers/lcd.h" 1
	cbi 5, 3;
 ;  0 "" 2
 ;  62 "./drivers/lcd.h" 1
	sbi 5, 4;
 ;  0 "" 2
 ;  62 "./drivers/lcd.h" 1
	cbi 5, 4;
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(3999)
	ldi r25,hi8(3999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ret
	.size	vLcdPrintChar, .-vLcdPrintChar
.global	vLcdPrintNumber
	.type	vLcdPrintNumber, @function
vLcdPrintNumber:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 14 */
.L__stack_usage = 14
	movw r16,r24
	sbiw r24,0
	brne .L7
	ldi r24,lo8(48)
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	jmp vLcdPrintChar
.L7:
	sbrs r25,7
	rjmp .L8
	ldi r24,lo8(45)
	call vLcdPrintChar
	neg r17
	neg r16
	sbc r17,__zero_reg__
.L8:
	movw r30,r28
	adiw r30,1
	ldi r24,lo8(6)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
	movw r14,r28
	ldi r27,6
	add r14,r27
	adc r15,__zero_reg__
	ldi r18,lo8(4)
	ldi r19,0
	ldi r24,lo8(10)
	mov r12,r24
	mov r13,__zero_reg__
.L9:
	movw r24,r16
	movw r22,r12
	call __divmodhi4
	subi r24,lo8(-(48))
	movw r26,r14
	st -X,r24
	movw r14,r26
	subi r18,1
	sbc r19,__zero_reg__
	movw r16,r22
	or r22,r23
	brne .L9
	subi r18,-1
	sbci r19,-1
	mov r15,__zero_reg__
	movw r16,r30
	add r16,r18
	adc r17,r19
.L10:
	movw r30,r16
	add r30,r15
	adc r31,__zero_reg__
	ld r24,Z
	tst r24
	breq .L13
	call vLcdPrintChar
	inc r15
	rjmp .L10
.L13:
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	vLcdPrintNumber, .-vLcdPrintNumber
	.ident	"GCC: (GNU) 5.4.0"

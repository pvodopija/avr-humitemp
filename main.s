	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	vLcdInstruction, @function
vLcdInstruction:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0xb,__zero_reg__
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
 ;  61 "drivers/lcd.h" 1
	swap r20                 
	lsr r20                  
	lsr r20                  
	in r18, 5              
	or r20, r18              
	out 5, r20              
	
 ;  0 "" 2
 ;  61 "drivers/lcd.h" 1
	cbi 5, 2;
 ;  0 "" 2
 ;  61 "drivers/lcd.h" 1
	cbi 5, 3;
 ;  0 "" 2
 ;  61 "drivers/lcd.h" 1
	sbi 5, 4;
 ;  0 "" 2
 ;  61 "drivers/lcd.h" 1
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
	.size	vLcdInstruction, .-vLcdInstruction
	.type	vLcdPrintChar, @function
vLcdPrintChar:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0xb,__zero_reg__
	cpi r24,lo8(10)
	brne .L3
	in r24,0xb
	out 0xb,r24
	in r24,0x5
	andi r24,lo8(-4)
	out 0x5,r24
	ldi r20,lo8(-64)
	ldi r21,0
/* #APP */
 ;  62 "drivers/lcd.h" 1
	swap r20                 
	lsr r20                  
	lsr r20                  
	in r18, 5              
	or r20, r18              
	out 5, r20              
	
 ;  0 "" 2
 ;  62 "drivers/lcd.h" 1
	cbi 5, 2;
 ;  0 "" 2
/* #NOAPP */
	rjmp .L5
.L3:
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
 ;  62 "drivers/lcd.h" 1
	swap r20                 
	lsr r20                  
	lsr r20                  
	in r18, 5              
	or r20, r18              
	out 5, r20              
	
 ;  0 "" 2
 ;  62 "drivers/lcd.h" 1
	sbi 5, 2;
 ;  0 "" 2
/* #NOAPP */
.L5:
/* #APP */
 ;  62 "drivers/lcd.h" 1
	cbi 5, 3;
 ;  0 "" 2
 ;  62 "drivers/lcd.h" 1
	sbi 5, 4;
 ;  0 "" 2
 ;  62 "drivers/lcd.h" 1
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
	.type	vLcdPrint, @function
vLcdPrint:
	push r16
	push r17
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r16,r24
	ldi r28,0
.L8:
	movw r30,r16
	add r30,r28
	adc r31,__zero_reg__
	ld r24,Z
	tst r24
	breq .L10
	call vLcdPrintChar
	subi r28,lo8(-(1))
	rjmp .L8
.L10:
/* epilogue start */
	pop r28
	pop r17
	pop r16
	ret
	.size	vLcdPrint, .-vLcdPrint
.global	setup
	.type	setup, @function
setup:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,0xa
	ori r24,lo8(-4)
	out 0xa,r24
	in r24,0x4
	ori r24,lo8(31)
	out 0x4,r24
/* #APP */
 ;  80 "drivers/lcd.h" 1
	cbi 5, 2;
 ;  0 "" 2
 ;  81 "drivers/lcd.h" 1
	cbi 5, 3;
 ;  0 "" 2
 ;  82 "drivers/lcd.h" 1
	cbi 5, 4;
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(56)
	call vLcdInstruction
	ldi r24,lo8(12)
	call vLcdInstruction
	out 0xb,__zero_reg__
	sbi 0xb,2
	in r24,0x5
	andi r24,lo8(-4)
	out 0x5,r24
	ldi r20,0
	ldi r21,0
/* #APP */
 ;  86 "drivers/lcd.h" 1
	swap r20                 
	lsr r20                  
	lsr r20                  
	in r18, 5              
	or r20, r18              
	out 5, r20              
	
 ;  0 "" 2
 ;  86 "drivers/lcd.h" 1
	cbi 5, 2;
 ;  0 "" 2
 ;  86 "drivers/lcd.h" 1
	cbi 5, 3;
 ;  0 "" 2
 ;  86 "drivers/lcd.h" 1
	sbi 5, 4;
 ;  0 "" 2
 ;  86 "drivers/lcd.h" 1
	cbi 5, 4;
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(3999)
	ldi r25,hi8(3999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r24,lo8(-25537)
	ldi r25,hi8(-25537)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	lds r24,124
	ori r24,lo8(64)
	sts 124,r24
	lds r24,122
	ori r24,lo8(-128)
	sts 122,r24
	lds r24,122
	andi r24,lo8(-2)
	sts 122,r24
	lds r24,124
	andi r24,lo8(-16)
	sts 124,r24
	lds r24,122
	ori r24,lo8(64)
	sts 122,r24
.L12:
	lds r24,122
	sbrc r24,6
	rjmp .L12
/* #APP */
 ;  50 "drivers/adc.h" 1
	lds r24, 0x78 
	lds r25, 0x79 
	
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	setup, .-setup
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"ECONCT"
.LC1:
	.string	"ETRANS"
.LC2:
	.string	"ECHKSUM"
.LC3:
	.string	"Humi: "
.LC4:
	.string	"%\nTemp: "
.LC5:
	.string	"\337C"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call setup
	ldi r16,0
	ldi r17,0
.L19:
	out 0xb,__zero_reg__
	sbi 0xb,2
	in r24,0x5
	andi r24,lo8(-4)
	out 0x5,r24
/* #APP */
 ;  24 "main.c" 1
	swap r16                 
	lsr r16                  
	lsr r16                  
	in r18, 5              
	or r16, r18              
	out 5, r16              
	
 ;  0 "" 2
 ;  24 "main.c" 1
	cbi 5, 2;
 ;  0 "" 2
 ;  24 "main.c" 1
	cbi 5, 3;
 ;  0 "" 2
 ;  24 "main.c" 1
	sbi 5, 4;
 ;  0 "" 2
 ;  24 "main.c" 1
	cbi 5, 4;
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(3999)
	ldi r25,hi8(3999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r22,lo8(5)
	ldi r24,lo8(35)
	ldi r25,0
	call iDhtRead
	cpi r24,lo8(-2)
	brne .L15
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	rjmp .L20
.L15:
	cpi r24,lo8(-3)
	brne .L17
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	rjmp .L20
.L17:
	cpi r24,lo8(-4)
	brne .L18
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	rjmp .L20
.L18:
	cpse r24,__zero_reg__
	rjmp .L16
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	call vLcdPrint
	lds r24,xDhtData
	ldi r25,0
	call vLcdPrintNumber
	ldi r24,lo8(46)
	call vLcdPrintChar
	lds r24,xDhtData+1
	ldi r25,0
	call vLcdPrintNumber
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	call vLcdPrint
	lds r24,xDhtData+2
	ldi r25,0
	call vLcdPrintNumber
	ldi r24,lo8(46)
	call vLcdPrintChar
	lds r24,xDhtData+3
	ldi r25,0
	call vLcdPrintNumber
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
.L20:
	call vLcdPrint
.L16:
	ldi r25,lo8(26666666)
	ldi r18,hi8(26666666)
	ldi r19,hlo8(26666666)
	ldi r24,hhi8(26666666)
1:	subi r25,1
	sbci r18,0
	sbci r19,0
	sbci r24,0
	brne 1b
	nop
	rjmp .L19
	.size	main, .-main
.global	ucINT0_FLAG
	.section .bss
	.type	ucINT0_FLAG, @object
	.size	ucINT0_FLAG, 1
ucINT0_FLAG:
	.zero	1
	.comm	xDhtData,5,1
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss

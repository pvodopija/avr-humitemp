	.file	"adc.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	uiAdcRead
	.type	uiAdcRead, @function
uiAdcRead:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r25,124
	andi r25,lo8(-16)
	or r24,r25
	sts 124,r24
	lds r24,122
	ori r24,lo8(64)
	sts 122,r24
/* #APP */
 ;  52 "./drivers/adc.h" 1
	nop
	nop
	nop
	nop
	nop
	nop
	
 ;  0 "" 2
/* #NOAPP */
.L2:
	lds r24,122
	sbrc r24,6
	rjmp .L2
	lds r18,120
	lds r19,121
/* #APP */
 ;  68 "./drivers/adc.h" 1
	ld r24, r18 
	ld r25, r19 
	
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	uiAdcRead, .-uiAdcRead
	.ident	"GCC: (GNU) 5.4.0"

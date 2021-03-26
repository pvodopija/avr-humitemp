
main.hex:     file format ihex


Disassembly of section .sec1:

00000000 <.sec1>:
   0:	0c 94 34 00 	jmp	0x68	;  0x68
   4:	0c 94 46 00 	jmp	0x8c	;  0x8c
   8:	0c 94 46 00 	jmp	0x8c	;  0x8c
   c:	0c 94 46 00 	jmp	0x8c	;  0x8c
  10:	0c 94 46 00 	jmp	0x8c	;  0x8c
  14:	0c 94 46 00 	jmp	0x8c	;  0x8c
  18:	0c 94 46 00 	jmp	0x8c	;  0x8c
  1c:	0c 94 46 00 	jmp	0x8c	;  0x8c
  20:	0c 94 46 00 	jmp	0x8c	;  0x8c
  24:	0c 94 46 00 	jmp	0x8c	;  0x8c
  28:	0c 94 46 00 	jmp	0x8c	;  0x8c
  2c:	0c 94 d8 00 	jmp	0x1b0	;  0x1b0
  30:	0c 94 46 00 	jmp	0x8c	;  0x8c
  34:	0c 94 46 00 	jmp	0x8c	;  0x8c
  38:	0c 94 46 00 	jmp	0x8c	;  0x8c
  3c:	0c 94 46 00 	jmp	0x8c	;  0x8c
  40:	0c 94 46 00 	jmp	0x8c	;  0x8c
  44:	0c 94 46 00 	jmp	0x8c	;  0x8c
  48:	0c 94 46 00 	jmp	0x8c	;  0x8c
  4c:	0c 94 46 00 	jmp	0x8c	;  0x8c
  50:	0c 94 46 00 	jmp	0x8c	;  0x8c
  54:	0c 94 46 00 	jmp	0x8c	;  0x8c
  58:	0c 94 46 00 	jmp	0x8c	;  0x8c
  5c:	0c 94 46 00 	jmp	0x8c	;  0x8c
  60:	0c 94 46 00 	jmp	0x8c	;  0x8c
  64:	0c 94 46 00 	jmp	0x8c	;  0x8c
  68:	11 24       	eor	r1, r1
  6a:	1f be       	out	0x3f, r1	; 63
  6c:	cf ef       	ldi	r28, 0xFF	; 255
  6e:	d8 e0       	ldi	r29, 0x08	; 8
  70:	de bf       	out	0x3e, r29	; 62
  72:	cd bf       	out	0x3d, r28	; 61
  74:	21 e0       	ldi	r18, 0x01	; 1
  76:	a0 e0       	ldi	r26, 0x00	; 0
  78:	b1 e0       	ldi	r27, 0x01	; 1
  7a:	01 c0       	rjmp	.+2      	;  0x7e
  7c:	1d 92       	st	X+, r1
  7e:	a1 30       	cpi	r26, 0x01	; 1
  80:	b2 07       	cpc	r27, r18
  82:	e1 f7       	brne	.-8      	;  0x7c
  84:	0e 94 e2 00 	call	0x1c4	;  0x1c4
  88:	0c 94 56 01 	jmp	0x2ac	;  0x2ac
  8c:	0c 94 00 00 	jmp	0	;  0x0
  90:	1b b8       	out	0x0b, r1	; 11
  92:	9b b1       	in	r25, 0x0b	; 11
  94:	44 e0       	ldi	r20, 0x04	; 4
  96:	84 9f       	mul	r24, r20
  98:	90 01       	movw	r18, r0
  9a:	11 24       	eor	r1, r1
  9c:	29 2b       	or	r18, r25
  9e:	2b b9       	out	0x0b, r18	; 11
  a0:	95 b1       	in	r25, 0x05	; 5
  a2:	9c 7f       	andi	r25, 0xFC	; 252
  a4:	95 b9       	out	0x05, r25	; 5
  a6:	80 7c       	andi	r24, 0xC0	; 192
  a8:	48 2f       	mov	r20, r24
  aa:	50 e0       	ldi	r21, 0x00	; 0
  ac:	42 95       	swap	r20
  ae:	46 95       	lsr	r20
  b0:	46 95       	lsr	r20
  b2:	25 b1       	in	r18, 0x05	; 5
  b4:	42 2b       	or	r20, r18
  b6:	45 b9       	out	0x05, r20	; 5
  b8:	2a 98       	cbi	0x05, 2	; 5
  ba:	2b 98       	cbi	0x05, 3	; 5
  bc:	2c 9a       	sbi	0x05, 4	; 5
  be:	2c 98       	cbi	0x05, 4	; 5
  c0:	8f e3       	ldi	r24, 0x3F	; 63
  c2:	9f e1       	ldi	r25, 0x1F	; 31
  c4:	01 97       	sbiw	r24, 0x01	; 1
  c6:	f1 f7       	brne	.-4      	;  0xc4
  c8:	00 c0       	rjmp	.+0      	;  0xca
  ca:	00 00       	nop
  cc:	08 95       	ret
  ce:	1b b8       	out	0x0b, r1	; 11
  d0:	9b b1       	in	r25, 0x0b	; 11
  d2:	44 e0       	ldi	r20, 0x04	; 4
  d4:	84 9f       	mul	r24, r20
  d6:	90 01       	movw	r18, r0
  d8:	11 24       	eor	r1, r1
  da:	29 2b       	or	r18, r25
  dc:	2b b9       	out	0x0b, r18	; 11
  de:	95 b1       	in	r25, 0x05	; 5
  e0:	9c 7f       	andi	r25, 0xFC	; 252
  e2:	95 b9       	out	0x05, r25	; 5
  e4:	80 7c       	andi	r24, 0xC0	; 192
  e6:	48 2f       	mov	r20, r24
  e8:	50 e0       	ldi	r21, 0x00	; 0
  ea:	42 95       	swap	r20
  ec:	46 95       	lsr	r20
  ee:	46 95       	lsr	r20
  f0:	25 b1       	in	r18, 0x05	; 5
  f2:	42 2b       	or	r20, r18
  f4:	45 b9       	out	0x05, r20	; 5
  f6:	2a 9a       	sbi	0x05, 2	; 5
  f8:	2b 98       	cbi	0x05, 3	; 5
  fa:	2c 9a       	sbi	0x05, 4	; 5
  fc:	2c 98       	cbi	0x05, 4	; 5
  fe:	8f e3       	ldi	r24, 0x3F	; 63
 100:	9f e1       	ldi	r25, 0x1F	; 31
 102:	01 97       	sbiw	r24, 0x01	; 1
 104:	f1 f7       	brne	.-4      	;  0x102
 106:	00 c0       	rjmp	.+0      	;  0x108
 108:	00 00       	nop
 10a:	08 95       	ret
 10c:	90 91 7c 00 	lds	r25, 0x007C	;  0x80007c
 110:	90 7f       	andi	r25, 0xF0	; 240
 112:	89 2b       	or	r24, r25
 114:	80 93 7c 00 	sts	0x007C, r24	;  0x80007c
 118:	80 91 7a 00 	lds	r24, 0x007A	;  0x80007a
 11c:	80 64       	ori	r24, 0x40	; 64
 11e:	80 93 7a 00 	sts	0x007A, r24	;  0x80007a
	...
 12e:	80 91 7a 00 	lds	r24, 0x007A	;  0x80007a
 132:	86 fd       	sbrc	r24, 6
 134:	fc cf       	rjmp	.-8      	;  0x12e
 136:	80 91 78 00 	lds	r24, 0x0078	;  0x800078
 13a:	20 91 79 00 	lds	r18, 0x0079	;  0x800079
 13e:	90 e0       	ldi	r25, 0x00	; 0
 140:	92 2b       	or	r25, r18
 142:	08 95       	ret
 144:	38 98       	cbi	0x07, 0	; 7
 146:	40 98       	cbi	0x08, 0	; 8
 148:	8a b1       	in	r24, 0x0a	; 10
 14a:	8c 6f       	ori	r24, 0xFC	; 252
 14c:	8a b9       	out	0x0a, r24	; 10
 14e:	84 b1       	in	r24, 0x04	; 4
 150:	8f 61       	ori	r24, 0x1F	; 31
 152:	84 b9       	out	0x04, r24	; 4
 154:	2a 98       	cbi	0x05, 2	; 5
 156:	2b 98       	cbi	0x05, 3	; 5
 158:	2c 98       	cbi	0x05, 4	; 5
 15a:	88 e3       	ldi	r24, 0x38	; 56
 15c:	0e 94 48 00 	call	0x90	;  0x90
 160:	8c e0       	ldi	r24, 0x0C	; 12
 162:	0e 94 48 00 	call	0x90	;  0x90
 166:	1b b8       	out	0x0b, r1	; 11
 168:	5a 9a       	sbi	0x0b, 2	; 11
 16a:	85 b1       	in	r24, 0x05	; 5
 16c:	8c 7f       	andi	r24, 0xFC	; 252
 16e:	85 b9       	out	0x05, r24	; 5
 170:	40 e0       	ldi	r20, 0x00	; 0
 172:	50 e0       	ldi	r21, 0x00	; 0
 174:	42 95       	swap	r20
 176:	46 95       	lsr	r20
 178:	46 95       	lsr	r20
 17a:	25 b1       	in	r18, 0x05	; 5
 17c:	42 2b       	or	r20, r18
 17e:	45 b9       	out	0x05, r20	; 5
 180:	2a 98       	cbi	0x05, 2	; 5
 182:	2b 98       	cbi	0x05, 3	; 5
 184:	2c 9a       	sbi	0x05, 4	; 5
 186:	2c 98       	cbi	0x05, 4	; 5
 188:	8f e3       	ldi	r24, 0x3F	; 63
 18a:	9f e1       	ldi	r25, 0x1F	; 31
 18c:	01 97       	sbiw	r24, 0x01	; 1
 18e:	f1 f7       	brne	.-4      	;  0x18c
 190:	00 c0       	rjmp	.+0      	;  0x192
 192:	00 00       	nop
 194:	8f e3       	ldi	r24, 0x3F	; 63
 196:	9c e9       	ldi	r25, 0x9C	; 156
 198:	01 97       	sbiw	r24, 0x01	; 1
 19a:	f1 f7       	brne	.-4      	;  0x198
 19c:	00 c0       	rjmp	.+0      	;  0x19e
 19e:	00 00       	nop
 1a0:	ea e7       	ldi	r30, 0x7A	; 122
 1a2:	f0 e0       	ldi	r31, 0x00	; 0
 1a4:	80 81       	ld	r24, Z
 1a6:	80 68       	ori	r24, 0x80	; 128
 1a8:	80 83       	st	Z, r24
 1aa:	80 e0       	ldi	r24, 0x00	; 0
 1ac:	0c 94 86 00 	jmp	0x10c	;  0x10c
 1b0:	1f 92       	push	r1
 1b2:	0f 92       	push	r0
 1b4:	0f b6       	in	r0, 0x3f	; 63
 1b6:	0f 92       	push	r0
 1b8:	11 24       	eor	r1, r1
 1ba:	0f 90       	pop	r0
 1bc:	0f be       	out	0x3f, r0	; 63
 1be:	0f 90       	pop	r0
 1c0:	1f 90       	pop	r1
 1c2:	18 95       	reti
 1c4:	cf 93       	push	r28
 1c6:	df 93       	push	r29
 1c8:	00 d0       	rcall	.+0      	;  0x1ca
 1ca:	00 d0       	rcall	.+0      	;  0x1cc
 1cc:	00 d0       	rcall	.+0      	;  0x1ce
 1ce:	cd b7       	in	r28, 0x3d	; 61
 1d0:	de b7       	in	r29, 0x3e	; 62
 1d2:	0e 94 a2 00 	call	0x144	;  0x144
 1d6:	c1 2c       	mov	r12, r1
 1d8:	d1 2c       	mov	r13, r1
 1da:	86 e0       	ldi	r24, 0x06	; 6
 1dc:	88 2e       	mov	r8, r24
 1de:	ae 01       	movw	r20, r28
 1e0:	4f 5f       	subi	r20, 0xFF	; 255
 1e2:	5f 4f       	sbci	r21, 0xFF	; 255
 1e4:	7a 01       	movw	r14, r20
 1e6:	9a e0       	ldi	r25, 0x0A	; 10
 1e8:	a9 2e       	mov	r10, r25
 1ea:	b1 2c       	mov	r11, r1
 1ec:	80 e0       	ldi	r24, 0x00	; 0
 1ee:	0e 94 86 00 	call	0x10c	;  0x10c
 1f2:	1b b8       	out	0x0b, r1	; 11
 1f4:	5a 9a       	sbi	0x0b, 2	; 11
 1f6:	25 b1       	in	r18, 0x05	; 5
 1f8:	2c 7f       	andi	r18, 0xFC	; 252
 1fa:	25 b9       	out	0x05, r18	; 5
 1fc:	a6 01       	movw	r20, r12
 1fe:	42 95       	swap	r20
 200:	46 95       	lsr	r20
 202:	46 95       	lsr	r20
 204:	25 b1       	in	r18, 0x05	; 5
 206:	42 2b       	or	r20, r18
 208:	45 b9       	out	0x05, r20	; 5
 20a:	2a 98       	cbi	0x05, 2	; 5
 20c:	2b 98       	cbi	0x05, 3	; 5
 20e:	2c 9a       	sbi	0x05, 4	; 5
 210:	2c 98       	cbi	0x05, 4	; 5
 212:	ef e3       	ldi	r30, 0x3F	; 63
 214:	ff e1       	ldi	r31, 0x1F	; 31
 216:	31 97       	sbiw	r30, 0x01	; 1
 218:	f1 f7       	brne	.-4      	;  0x216
 21a:	00 c0       	rjmp	.+0      	;  0x21c
 21c:	00 00       	nop
 21e:	00 97       	sbiw	r24, 0x00	; 0
 220:	21 f4       	brne	.+8      	;  0x22a
 222:	80 e3       	ldi	r24, 0x30	; 48
 224:	0e 94 67 00 	call	0xce	;  0xce
 228:	23 c0       	rjmp	.+70     	;  0x270
 22a:	f7 01       	movw	r30, r14
 22c:	28 2d       	mov	r18, r8
 22e:	11 92       	st	Z+, r1
 230:	2a 95       	dec	r18
 232:	e9 f7       	brne	.-6      	;  0x22e
 234:	fe 01       	movw	r30, r28
 236:	36 96       	adiw	r30, 0x06	; 6
 238:	24 e0       	ldi	r18, 0x04	; 4
 23a:	30 e0       	ldi	r19, 0x00	; 0
 23c:	b5 01       	movw	r22, r10
 23e:	0e 94 42 01 	call	0x284	;  0x284
 242:	80 5d       	subi	r24, 0xD0	; 208
 244:	82 93       	st	-Z, r24
 246:	21 50       	subi	r18, 0x01	; 1
 248:	31 09       	sbc	r19, r1
 24a:	cb 01       	movw	r24, r22
 24c:	00 97       	sbiw	r24, 0x00	; 0
 24e:	b1 f7       	brne	.-20     	;  0x23c
 250:	2f 5f       	subi	r18, 0xFF	; 255
 252:	3f 4f       	sbci	r19, 0xFF	; 255
 254:	91 2c       	mov	r9, r1
 256:	87 01       	movw	r16, r14
 258:	02 0f       	add	r16, r18
 25a:	13 1f       	adc	r17, r19
 25c:	f8 01       	movw	r30, r16
 25e:	e9 0d       	add	r30, r9
 260:	f1 1d       	adc	r31, r1
 262:	80 81       	ld	r24, Z
 264:	88 23       	and	r24, r24
 266:	21 f0       	breq	.+8      	;  0x270
 268:	0e 94 67 00 	call	0xce	;  0xce
 26c:	93 94       	inc	r9
 26e:	f6 cf       	rjmp	.-20     	;  0x25c
 270:	4f ef       	ldi	r20, 0xFF	; 255
 272:	57 ea       	ldi	r21, 0xA7	; 167
 274:	81 e6       	ldi	r24, 0x61	; 97
 276:	41 50       	subi	r20, 0x01	; 1
 278:	50 40       	sbci	r21, 0x00	; 0
 27a:	80 40       	sbci	r24, 0x00	; 0
 27c:	e1 f7       	brne	.-8      	;  0x276
 27e:	00 c0       	rjmp	.+0      	;  0x280
 280:	00 00       	nop
 282:	b4 cf       	rjmp	.-152    	;  0x1ec
 284:	aa 1b       	sub	r26, r26
 286:	bb 1b       	sub	r27, r27
 288:	51 e1       	ldi	r21, 0x11	; 17
 28a:	07 c0       	rjmp	.+14     	;  0x29a
 28c:	aa 1f       	adc	r26, r26
 28e:	bb 1f       	adc	r27, r27
 290:	a6 17       	cp	r26, r22
 292:	b7 07       	cpc	r27, r23
 294:	10 f0       	brcs	.+4      	;  0x29a
 296:	a6 1b       	sub	r26, r22
 298:	b7 0b       	sbc	r27, r23
 29a:	88 1f       	adc	r24, r24
 29c:	99 1f       	adc	r25, r25
 29e:	5a 95       	dec	r21
 2a0:	a9 f7       	brne	.-22     	;  0x28c
 2a2:	80 95       	com	r24
 2a4:	90 95       	com	r25
 2a6:	bc 01       	movw	r22, r24
 2a8:	cd 01       	movw	r24, r26
 2aa:	08 95       	ret
 2ac:	f8 94       	cli
 2ae:	ff cf       	rjmp	.-2      	;  0x2ae

		AREA palindrome, CODE, READONLY	
		ENTRY
			; source: http://www.ing.unlp.edu.ar/electrotecnia/arcom1/09-Clements-Chap09-ARM.pdf
		
start
		ldr	r0, =srcstr
		mov	r1,r0						;copy r0 data
loop		ldrb	r2,[r1],#1 			;Double word
		cmp	r2,#0
		bne	loop
		sub	r1,r1,#2
		bl	pal

pal		mov	r10, #0x0
loop2	ldrb	r3, [r0]
		ldrb	r4, [r1]
		cmp	r3, r4
		bne	notpal

		cmp 	r0, r1
		beq	waspal
		add	r2,r0,#1
		cmp	r2,r1
		beq	waspal

		add	r0,r0,#1
		sub	r1,r1,#1
		b 	loop2
		
waspal		mov	r10, #0x1
notpal		bx lr

		AREA	Strings, DATA
srcstr  DCB     "First string - source",0
dststr  DCB     "Second string - destination",0
		END
		END
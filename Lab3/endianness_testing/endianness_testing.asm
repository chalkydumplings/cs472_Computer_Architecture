	AREA endianness_testing, CODE, READWRITE	
		ENTRY
;A function which tests the endianness of the system, and flips it as requested. This will be expanded upon in a later lab to examine the concept of endian neutral programming.


	MOV		R0, #1 ; if 1, swap

	ADR		R1, x
	LDRB	R2, [R1], #1
	LDRB	R2, [R1], #1
	LDRB	R2, [R1], #1
	
	ADR		R3, y
	LDRB 	R4, [R3], #1
	
	CMP     R2, R4
	BEQ     big ;
	b		small

big 
	CMP		R0, #1
	BNE		l
	b		swap

small
	CMP		R0, #1
	BNE		l
	b		swap

swap

	ADR	r10, swapthis
	LDR r0, [r10]
	LDR r3, [r10] ; for storage purposes
	
	EOR r1, r0, r0, ROR #16
	
	BIC r1, r1, #0x00ff0000
	MOV r0, r0, ror #8
	EOR r0, r0, r1, lsr #8

l 	b 		l	; infinite loop

x   	    DCD  	4294945450 ; ffffaaaa
			space   10
y   	    DCD  	2863311530 ; aaaaaaaa
	
	
swapthis	DCD		2882400018
	END
	
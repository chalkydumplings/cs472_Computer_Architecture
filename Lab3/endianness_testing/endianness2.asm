	AREA endianness_testing, CODE, READWRITE	
		ENTRY
;A function which tests the endianness of the system, and flips it as requested. This will be expanded upon in a later lab to examine the concept of endian neutral programming.

	MOV		R0, #1 ; if 1, swap

	ADR 	R1, src1 
	LDRB	R2, [R1], #1
	LDRB	R2, [R1], #1 ;r2 contains second byte? (2)
	
	ADR 	R3, src2 
	LDRB	R4, [R3], #1 ;r5 contains 2

	
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
	


l 	b 		l	; infinite loop
src1 = 			"12"
src2	=		"2"
	END
	
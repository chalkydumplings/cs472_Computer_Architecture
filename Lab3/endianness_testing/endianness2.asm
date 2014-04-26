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
	
l 	b 		l	; infinite loop

x   	    DCD  	4294945450 ; ffffaaaa
			space   10
y   	    DCD  	2863311530 ; aaaaaaaa

	END
	
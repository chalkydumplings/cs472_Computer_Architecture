	AREA endianness_testing, CODE, READWRITE	
		ENTRY
;A function which tests the endianness of the system, and flips it as requested. This will be expanded upon in a later lab to examine the concept of endian neutral programming.

	ADR 	R1, src 
	LDRB	R2, [R1], #1
	BEQ     R2, 

l 	b 		l	; infinite loop
src = 			"ABC"	
	END
	
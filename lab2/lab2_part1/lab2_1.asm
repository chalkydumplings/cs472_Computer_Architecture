	AREA lab2_1, CODE, READONLY	
	ENTRY
	
PART1
	MOV r0, #6 			;a
	MOV r1, #3 			;b
	MOV r2, #4 			;c;	MOV r3, #3 			;d
	MOV r4, #2 			;e


	ADD r1,r1,r1 			;r1=r1+r1 || b=b+b
	ADD r1,r1,r0			;r1=r1+r0 || b=a+(b+b)
	
	;for muls you have to have diff destination register
	MULS r5,r3,r4			;r5=r3+r4 || z=d*e
	SUB r5,r1,r5			;r5=r1-r3 || z=b-(d*e)
	
PART2
	ADR r6, A
	ADR r7, C
	ADR r8, D
	ADR r9, E
	ADR r10, F
	ADR r11, Z
A   DCD  4
C   DCD  -2
D   DCD  3
E   DCD  -12
F   DCD  5
Z  	DCD  0


	ADD r7,r7,r7 			; b=b+b
	ADD r7,r7,r6			; b=a+(b+b)

	MULS r11,r8,r9			; z=d*e
	SUB r11,r7,r11			; z=b-(d*e)
	
	
	END
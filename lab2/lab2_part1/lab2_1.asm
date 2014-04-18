	AREA lab2_1, CODE, READONLY	
	ENTRY
	
	MOV r0, #6 			;a
	MOV r1, #3 			;b
	MOV r2, #4 			;c;	MOV r3, #3 			;d
	MOV r4, #2 			;e


	ADD r1,r1,r1 			;r1=r1+r1 || b=b+b
	ADD r1,r1,r0			;r1=r1+r0 || b=a+(b+b)
	
	;for muls you have to have diff destination register
	MULS r5,r3,r4			;r5=r3+r4 || z=d*e
	SUB r5,r1,r5			;r5=r1-r3 || z=b-(d*e)
	
	END
		AREA lab2_3_fixed, CODE, READONLY	
		ENTRY
	
		ADR r0, A
		ADR r2, C
		ADR r4, D
		ADR r6, E
		ADR r8, F
		ADR r10, Z
A   DCD  4
C   DCD  -2
D   DCD  3
E   DCD  -12
F   DCD  5
Z  	DCD  0


		ADD r2,r2,r2
		ADD r2,r2,r0
	
		MULS r10,r6,r8	
		SUB r10,r2,r10
	
		END
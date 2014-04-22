<<<<<<< HEAD
		AREA NullTerminatingString, CODE, READWRITE	
		ENTRY
		;;modification of code from section 3.9.11
		;;copies from r0 to r1
		
copystr	ADR R0, src ; r0 points at string 
		LDR R1, =0x0000005f   ; a location of safe mem?
loop	LDRB	R2, [R0], #1 ; grab first character, increment pointer
		CMP 	R2, #0x00 ; are we at the end?
		STRB 	R2, [r1], #1 ; if not, copy to address location (from r1)
		;ADD		R1, #1 ; increment r1
		BNE 	loop ; if not at the end... we move onto the next character
		MOV		PC, R14

src = 		"aaaaaaaazzzzzz", &0A, &0D, 0
		
=======
		AREA NullTerminatingString, CODE, READONLY	
		ENTRY
		;;copy of code from section 3.9.11
		
Banner	ADR R1, String
Bnner1	LDRB	R0, [R10], #1
		CMP 	R0, #0
		SVCNE 	WriteC
		BNE 	Bnner1
		MOV		PC, R14

String =	"A String goes here!", &0A, &0D, 0
WriteC	EQU		0
>>>>>>> 429ce864761d563cd133c94e92b8270e282d7844
		END
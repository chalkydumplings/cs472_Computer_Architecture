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
		END
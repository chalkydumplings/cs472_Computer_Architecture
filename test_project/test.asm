			AREA test, CODE, READWRITE	
			ENTRY
			
			LDR		R0, #0		;operand 2 flag
			LDR		R1, #0x21
			LDR		R2, #0x401
			LDR 	R3, #0x1000
			
			
			ADR		R5, R1	;points to R1
			ADR		R6, R2	;points to R2
			ADR		R7, R3	;points to R3
			
			
loop		CMP		;fist bit of r2 		
					;if == 0 branch to shift
					;add to result
shift		LSL			;left shift
					;if not reached end
			BEQ loop		;==1 branch to loop
			
			
			CMP 	R0, #1		
			BEQ		endless		;if we have
			ADR		R6, R3		;change pointer to R7
			LDR		R0, #1		;set flag saying switched operand 2
			B 		loop 		;now step through mult everything by r3
			
endless 	B endless			
			END
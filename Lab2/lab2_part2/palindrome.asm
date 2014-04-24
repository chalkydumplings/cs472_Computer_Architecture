						AREA palindrome, CODE, READWRITE	
						ENTRY

			    	MOV     R0, #1 ; palindrome flag set at true
	        	ADR 	R1, src ; r0 points at string
			    	ADR 	R2, src ; r1 points at string END
			 
            ;get pointer to end of the string and store in r2
            ;R2 is temp pointer
getstrend   LDRB    R3, [R2], #1        ;load r0 into r2 and increment
        
            CMP R3, #0x00
            BNE		getstrend
        
        		SUB     R2, #2 
loop				CMP     R1, R2
		        BEQ     pass
		        LDRB	R3, [R1], #1 ; grab first character, increment pointer
		        LDRB	R4, [R2], #-1 ; grab last character, decrement pointer
						CMP 	R3, R4 ; do they match?
						BNE     fail
						CMP     R1, R2 ; if these addresses are the same... we are done
						BEQ		pass
		
		
						B 	loop ; if not at the end... we move onto the next character
				
fail				MOV     R0, #0 ; is not a palindrome
		        B		fail ; infinite loop!
		        
pass    		MOV     R0, #1 ; if a palindrome
		        B		pass ; infinite loop!


src = 			"amanaplanacanalpanama"
						END
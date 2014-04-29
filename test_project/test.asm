    AREA test, CODE, READWRITE    
		ENTRY
		
		; multiply input by 33 -> original += 4 byte shift
		MOV        R0, #4095             ; 
		MOV        R1, R0, LSL #5         ; r1 = r0 * 2^5 
		ADD        R2, R1, R0            ; r2 = r1 + r0
									; hooray, r2 contains r0 * 33
									
		; multiply input by 33 -> original += 4 byte shift
		MOV        R0, R2                 ; 
		MOV        R1, R0, LSL #10        ; r1 = r0 * 2^5 
		ADD        R2, R1, R0            ; r2 = r1 + r0
									; hooray, r2 contains r0 * 33
		space     10
	
		END
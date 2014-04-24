		AREA block_move, CODE, READWRITE
		ENTRY
		ADR		r0, Table
		MOV 	r1, #0x11
		MOV 	r2, #0x22
		MOV 	r3, #0x33
		MOV 	r4, #0x44
		
		STMIA	r0!,{r1-r4}
		
		SPACE	100
Table	DCD		0x22222222	
		SPACE	50
			
		END
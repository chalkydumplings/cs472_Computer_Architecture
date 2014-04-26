		AREA quad_func, CODE, READWRITE	
		ENTRY

		; mul requires more than one register
		; we must assume then that we can modify registers?
		; let's just save r1-r4 and then restore at the end
		;
		; note: i had to memmap 0xfffffff0, 0xffffffff to write in order to use sp
		STMDB 	sp!,{r1-r4}

		MOV 	r0, #5 ; user input
				
		MUL		r1, r0, r0 ; x^2 -> r1
		LDR		r2, Cv ;
		MUL		r4, r1, r2 ; cx^2 -> r4
		
		LDR		r2, Bv ;
		MUL		r3, r0, r2 ; bx -> r3
		
		LDR 	r2, Av ; a -> r2
		
		ADD 	r1, r2, r3 ; a + bx -> r1
		ADD 	r1, r1, r4 ; (a + bx) + cx^2 -> r1
		
		LDR		r2, Dv ; 
		CMP 	r1, r2 ; compare result to Constraint
		BLE		Finish ; it's less than... good!
		MOV		r1, r2 ; else: replace with constaint
Finish
		MOV		r0, r1 ; r0 contains final result
		
		; restore registers
		LDMIA  	SP!, {r1-r4}
		
Done	B		Done		
		
		
		; These are the customs variables for A,B,C, & D
Av   	DCD  	2
Bv   	DCD  	3
Cv   	DCD  	4
Dv		DCD		200 ; our constraint

		END
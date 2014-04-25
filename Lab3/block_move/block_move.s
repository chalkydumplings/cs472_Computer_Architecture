	AREA block_move, CODE, READWRITE	
		ENTRY

	; note - memmap:
	; rw for: 0xffff0000, 0xffffffff
	; for stack pointer?

	; adding in values for testing
	MOV	r1, #1;
	MOV	r2, #2;
	MOV	r3, #3;
	MOV	r4, #4;
	MOV	r5, #5;
	MOV	r6, #6;
	MOV	r7, #7;

	STMDB 	sp!,{r1-r7}
	LDMIA  	sp!, {r3-r7}
	LDMIA  	sp!, {r1,r2}

l 	b 		l	; infinite loop
	
	END
	
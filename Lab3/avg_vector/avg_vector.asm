		AREA avg_vector, CODE, READONLY
			
		; once again: map -> rwe: 0, 0x0000ffff	
			
		MOV 	r0, #0 ; our counter
		
		ADR		r1, Va
		ADR		r2, Vb
		ADR		r3, Vc
			
loop	LDR 	r4, [r1], #4
		LDR 	r5, [r2], #4
		CMP 	r0, #8 ; if at 7, we have performed all 8 calculations
		BEQ 	done
		ADD		r0, #1 ; increment our loop counter
		ADD 	r7, r4, r5
		ASR		r7, r7, #1 ; shift of one bit divides by 2
		
		STR		r7, [r3], #4 ; save value to Vc
		
		b		loop
		
done	b 		done

Va		DCD	5,5,5,5,7,7,7,8
Vb		DCD	1,2,3,4,5,6,7,8
Vc		DCD 0,0,0,0,0,0,0,0 ; this is just a place holder for Vc

		END
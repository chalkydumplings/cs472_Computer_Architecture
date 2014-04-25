			AREA source, CODE, READWRITE	
			ENTRY

main        B blockmv     ;problem 1 on lab3
            B quad_func
			B avg_vect
			B done


blockmv     BL set      ;Branch with link: saves the return address in register
                        ; R14
            BL load
            BL restore
            B restore      ;return

set         MOV	r1, #1;
			MOV	r2, #2;
			MOV	r3, #3;
			MOV	r4, #4;
			MOV	r5, #5;
			MOV	r6, #6;
			MOV	r7, #7;
            MOV pc, lr  ;moves lr (exception retrun with out popping anything
                        ;from the stack, you can also use 
                        ;MOV R15, R14
load        STMDB 	sp!,{r1-r7}
			LDMIA  	sp!, {r3-r7}
			LDMIA  	sp!, {r1,r2}
			B restore

            B done
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;part2
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
		
            B		done		
		
		
		; These are the customs variables for A,B,C, & D
Av   	    DCD  	2
Bv   	    DCD  	3
Cv   	    DCD  	4
Dv		    DCD		200 ; our constraint

                        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;part 3
avg_vect
load1       MOV pc, lr
            LDRFD R1!, {R1-R7}
            STRFD R1!, {R1-R7}
			B restore

    		MOV 	r0, #0 ; our counter
    		
    		ADR		r1, Va
    		ADR		r2, Vb
    		ADR		r3, Vc
    			
loop	    LDR 	r4, [r1], #4
    		LDR 	r5, [r2], #4
    		CMP 	r0, #8 ; if at 7, we have performed all 8 calculations
    		BEQ 	done
    		ADD		r0, #1 ; increment our loop counter
    		ADD 	r7, r4, r5
    		ASR		r7, r7, #1 ; shift of one bit divides by 2
    		
    		STR		r7, [r3], #4 ; save value to Vc
    		
    		b		loop
    		
            b 		done

Va		    DCD	5,5,5,5,7,7,7,8
Vb		    DCD	1,2,3,4,5,6,7,8
Vc		    DCD 0,0,0,0,0,0,0,0 ; this is just a place holder for Vc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
restore     MOV pc, lr

done        b done

			END
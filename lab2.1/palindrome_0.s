#
# compiled from palindrome.c
# using: http://gcc.godbolt.org/
# compiler: arm-linux-gnueabi-g++-4.6 
# optimization level: 0
#
.LC0:
	.ascii	"**************palindrome.c************\000"
.LC1:
	.ascii	"****By Drake Bridgewater and Ryan Phillips****\000"
.LC2:
	.ascii	"Usage: %s INPUT_STRING_HERE \012\000"
.LC3:
	.ascii	"Note: Only accepts odd length input strings \000"
noop_message(int, char**):
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	puts
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	mov	r1, r3
	bl	printf
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	puts
	add	r7, r7, #8
	mov	sp, r7
	pop	{r7, pc}
main:
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
	ldr	r0, [r7, #16]
	bl	strlen
	mov	r3, r0
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r3, #1
	beq	.L3
	ldr	r3, [r7, #4]
	cmp	r3, #2
	bgt	.L3
	ldr	r2, [r7, #20]
	asr	r3, r2, #31
	lsr	r3, r3, #31
	adds	r2, r2, r3
	and	r2, r2, #1
	subs	r3, r2, r3
	cmp	r3, #1
	beq	.L4
.L3:
	ldr	r0, [r7, #4]
	ldr	r1, [r7, #0]
	bl	noop_message(int, char**)
	mov	r3, #0
	b	.L5
.L4:
	mov	r3, #1
	str	r3, [r7, #8]
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L6
.L8:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	adds	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r1, [r7, #20]
	ldr	r3, [r7, #12]
	subs	r3, r1, r3
	add	r3, r3, #-1
	ldr	r1, [r7, #16]
	adds	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L7
	mov	r3, #0
	str	r3, [r7, #8]
.L7:
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L6:
	ldr	r3, [r7, #20]
	add	r3, r3, #-1
	lsr	r2, r3, #31
	adds	r3, r2, r3
	asr	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #12]
	cmp	r2, r3
	ite	le
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L8
	ldr	r3, [r7, #8]
.L5:
	mov	r0, r3
	add	r7, r7, #24
	mov	sp, r7
	pop	{r7, pc}
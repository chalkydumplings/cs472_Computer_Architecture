#
# compiled from palindrome.c
# using: http://gcc.godbolt.org/
# compiler: arm-linux-gnueabi-g++-4.6 
# optimization level: 3
#
noop_message(int, char**):
	push	{r4, lr}
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	mov	r4, r1
	bl	puts
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	puts
	movs	r0, #1
	ldr	r2, [r4, #0]
	movw	r1, #:lower16:.LC2
	movt	r1, #:upper16:.LC2
	bl	__printf_chk
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	pop	{r4, lr}
	b	puts
main:
	push	{r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, [r1, #4]
	mov	r6, r1
	mov	r0, r4
	bl	strlen
	sub	r2, r5, #1
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	cmp	r5, #2
	it	gt
	orrgt	r3, r3, #1
	cbnz	r3, .L3
	lsrs	r2, r0, #31
	adds	r1, r0, r2
	and	r1, r1, #1
	subs	r1, r1, r2
	cmp	r1, #1
	beq	.L11
.L3:
	mov	r0, r5
	mov	r1, r6
	bl	noop_message(int, char**)
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L11:
	subs	r6, r0, #1
	add	r6, r6, r6, lsr #31
	asrs	r6, r6, #1
	cmp	r6, #0
	ble	.L12
	adds	r2, r4, r0
	mov	r0, r1
.L8:
	ldrb	r5, [r4, r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	ldrb	r1, [r2, #-1]!	@ zero_extendqisi2
	cmp	r5, r1
	it	ne
	movne	r0, #0
	cmp	r3, r6
	bne	.L8
	pop	{r4, r5, r6, pc}
.L12:
	mov	r0, r1
	pop	{r4, r5, r6, pc}
.LC0:
	.ascii	"**************palindrome.c************\000"
.LC1:
	.ascii	"****By Drake Bridgewater and Ryan Phillips****\000"
.LC2:
	.ascii	"Usage: %s INPUT_STRING_HERE \012\000"
.LC3:
	.ascii	"Note: Only accepts odd length input strings \000"

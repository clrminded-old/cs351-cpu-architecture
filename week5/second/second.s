.data
x: 
	.word 4	@ .word is (4 bytes) and assigning it value 4
y:
	.word 90	@ .word (4 bytes) and assigning it value 3

.text
.global main

main:
	ldr r1, addressOfX
	LDR R1, [R1]

	LDR R2, addressOfY
	LDR R2, [R2]

	ADD R0, R1, R2

	bx lr


addressOfX: .word x	@ variable name addressOfX is size .word and assign x
addressOfY: .word y



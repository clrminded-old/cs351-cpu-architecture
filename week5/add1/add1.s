@add1.s ARM assembly language program to add some data and store the sum in R3

	.global _start
_start:
	MOV	R1, #0x25	@ R1 = 0x25
	MOV	R2, #0x34	@ R2 = 0x34
	ADD	R3, R2, R1	@ R3 = R2 + R1
	MOV	R0, R3		@ return value in R3
	MOV 	R7, #1		@ exit system call
	SVC	0

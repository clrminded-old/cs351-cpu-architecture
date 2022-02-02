.data                   @ Data section
.balign 4               @ align  words into 4 byte alignments

x:                      @ create a variable called x
    .word 0             @ the type of the variable x is a word(4bytes) with value 0

y:
    .word 0

.text                   @ Text section
.global main        

main:
    mov r1, #13         @ Place 13 into register 1
    ldr r2, addressOfX  
    str r1, [r2]

    mov r1, #14
    ldr r3, addressOfY
    str r1, [r3]

    ldr r4, [r2]
    ldr r5, [r3]
    add r0, r4, r5

    bx lr

addressOfX: .word x
addressOfY: .word y

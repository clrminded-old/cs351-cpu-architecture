.data
.balign 4

x:
    .word 0

y:
    .word 0

.text
.global main
main:
    mov r1, #20
    ldr r2, addressOfX
    str r1, [r2]

    mov r1, #10
    ldr r3, addressOfY
    str r1, [r3]

    ldr r4, [r2]
    ldr r5, [r3]
    sub r0, r4, r5

    bx lr
    


addressOfX: .word x
addressOfY: .word y

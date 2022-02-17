.data
a:                  @ variable a is the array
    .skip 40        @ integer array 4 bytes each with 10 addresses
i: 
    .word

.text
.global main

main:
    ldr r1, addressOfA 
    ldr r2, addressOfI
    mov r3, #0
    str r3, [r2]
    b test

loop:
    ldr r3, [r2]
    add r4, r1,r3,LSL #2
    str r3, [r4]
    add r3, r3, #1
    str r3, [r2]

test:
    ldr r3, [r2]
    cmp r3, #10
    blt loop

end:
    mov r0, r3
    bx lr


addressOfA: .word a
addressOfI: .word i

.data
arr:
        .word   1
        .word   17
        .word   24
        .word   31
        .word   45
        .word   55

n:  .word   5
i: .word 0

p2: .asciz "%d "
newline:    .asciz "\n"

.text
main:
    str lr, [sp, #-4]!

    




    bl print

    ldr lr, [sp], #+4
    bx lr

// print function
print:
    str lr, [sp, #-4]!

    ldr r1, addressOfArr
    ldr r2, addressOfI
    ldr r3, [r2]
    b test

loop:
    ldr r1, addressOfArr
    ldr r2, addressOfI
    ldr r3, [r2]
    
    ldr r0, addP2
    ldr r1, [r1, r3, LSL #2]
    bl printf

    ldr r2, addressOfI
    ldr r3, [r2]
    add r3, r3, #1
    str r3, [r2]

test:
    ldr r3, [r2]
    cmp r3, #6
    blt loop

    ldr r0, addressOfNewline
    bl printf

    ldr lr, [sp], #+4
    bx lr
// end of print function

.global main
.global printf

addressOfArr: .word arr
addressOfI: .word i
addP2: .word p2
addressOfNewline: .word newline

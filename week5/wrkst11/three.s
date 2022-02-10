.data
x: .word 2
y: .word 2

.text
.global main
main:
    ldr r0, addX
    ldr r1, addY

    ldr r2, [r0]
    ldr r3, [r1]

    cmp r2, r3
    bne sec
    sub r2, r2, #1
    str r2, [r0]
    
    add r3, r3, #1
    str r3, [r1]
    b end

sec:
    


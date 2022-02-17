@ this is a program with an average function
.text
.global main

average:
    add r0, r0, r1
    add r0, r0, r2
    add r0, r0, r3
    mov r4, #4
    sdiv r0, r0, r4
    bx lr

main:
    str lr, [sp,#-4]!
    
    mov r0, #1
    mov r1, #5
    mov r2, #10
    mov r3, #12
    bl average

    ldr lr, [sp],#+4
    bx lr





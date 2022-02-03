.data
x:
    .word 10

.text
.global main
main:
    ldr r0, addressOfX
    str r1, [r0]

    cmp r1, #0
    bgt section1


section1:
    mov r0, #1
    b end

end:
    bx lr


addressOfX:
    .word x

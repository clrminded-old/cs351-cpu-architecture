.data
x:  .word 0

.text
.global main
main:
    ldr r1, addressOfX
    ldr r1, [r1]

    cmp r1, #0
    bgt true
    
    mov r0, #0
    b end


true:
    mov r0, #1
    b end

end:
    bx lr


addressOfX: .word x

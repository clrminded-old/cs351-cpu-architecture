@ this program should return 10
.data

x:
    .word 10
y:
    .word 3

.text
.global main
main:
    ldr r1, addressOfX
    ldr r1, [r1]

    ldr r2, addressOfY
    ldr r2, [r2]
    
    cmp r1, #0
    bgt section1
    b section4

section1:
    cmp r1, r2
    bgt section2
    b section3

section2:
    mov r0, r1
    b end

section3:
    mov r0, r2
    b end

section4:
    mov r0, #-1
    b end

end:
    bx lr



addressOfX: .word x
addressOfY: .word y

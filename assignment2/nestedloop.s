// This is a program in ARM assembly that will print a triangle of 
// given size to print to the screen

.data

i: .word 1
j: .word 0
space: .word 0
rows: .word 8

stars:  .asciz  "*"
spaces: .asciz  "+"
newline: .asciz "\n"


.text
main:
    str lr, [sp, #-4]!
 
loop0:
    ldr r1, addressOfI
    ldr r2, addressOfRows
    ldr r3, [r1]
    ldr r4, [r2]

    cmp r3, r4
    bgt done

    ldr r1, addressOfJ
    ldr r2, [r1]
    mov r2, #1
    str r2, [r1]

loop1:
    ldr r1, addressOfJ
    ldr r2, addressOfRows
    ldr r3, [r1]
    ldr r4, [r2]
    
    
    cmp r3, r4
    bgt loop0_end

    ldr r0, addressOfStars
    bl printf

loop1_end:
    ldr r1, addressOfJ
    ldr r2, [r1]
    add r2, r2, #1
    str r2, [r1]
    b loop1


    

loop0_end:
    ldr r0, addressOfNewline
    bl printf
    ldr r1, addressOfI
    ldr r2, [r1]
    add r2, r2, #1
    str r2, [r1]
    b loop0    

done:
    ldr lr, [sp], #+4           // pop the lr from the stack
    bx lr


.global main
.global printf

addressOfI: .word i
addressOfJ: .word j
addressOfSpace: .word space
addressOfRows: .word rows
addressOfStars: .word stars
addressOfSpaces: .word spaces
addressOfNewline: .word newline



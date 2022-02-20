// This is a program in ARM assembly that will print a triangle of 
// given size to print to the screen

.data

i: .word 0
j: .word 0
outer_length: .word 7
inner1_length: .word 8
inner2_length: .word 8
base_length: .word 8

stars:  .asciz  "*"
spaces: .asciz  "+"
newline: .asciz "\n"


.text
main: 
    str lr, [sp, #-4]!          // push the lr to the stack

outer:
    ldr r1, addressOfI
    ldr r2, addressOfOuterLength
    ldr r3, [r1]
    mov r4, #0
    str r4, [r1]
    ldr r4, [r2]
    b outer_mid

outer_loop:
    ldr r1, addressOfI
    ldr r2, addressOfOuterLength
    ldr r3, [r1]
    ldr r4, [r2]
    cmp r3, r4
    bge outer_done
    

    ldr r0, addressOfNewline
    bl printf
    

inner2:
    ldr r1, addressOfJ
    ldr r2, addressOfInner2Length
    ldr r3, [r1]
    ldr r4, [r2]
    add r4, r3, r4
    sub r4, r4, #1
    str r4, [r2]
    b inner2_mid

inner2_loop:
    ldr r0, addressOfStars
    bl printf
    ldr r1, addressOfJ
    ldr r2, addressOfInner2Length
    ldr r3, [r1]
    add r3, r3, #1
    str r3, [r1]
    ldr r4, [r2]

inner2_mid:
    cmp r3, r4
    blt inner2_loop

inner_done:
    ldr r1, addressOfI
    ldr r2, [r1]
    add r2, r2, #1
    str r2, [r1]
    b outer_loop

outer_mid:
    cmp r3, r4
    blt outer_loop

outer_done:


// ------------------------------------------------------
// create the base 
base:
    ldr r0, addressOfNewline
    bl printf


    ldr r1, addressOfI          // at this point i has a value of 8, so we need to reset
    ldr r2, addressOfBaseLength // load up values of rows
    ldr r3, [r1]                // value in r1 is 8, we will load it into r3
    mov r4, #0                  // mov a 0 into r4, this is what we will replace the 8 with
    str r4, [r1]                // store 0 back into memory for the value of r1
    ldr r4, [r2]                // replace r4 with the value in r2
    mov r4, r4, lsl #1          // doubling 8 is 16 meaning we can bitshift to the left 1 time
    sub r4, r4, #1              // subtract 1 to meet conditional we want for the base
    b base_mid

base_loop:
    ldr r0, addressOfStars
    bl printf

    ldr r1, addressOfI
    ldr r3, [r1]
    add r3, r3, #1
    str r3, [r1]

base_mid:
    cmp r3, r4
    blt base_loop


end:
    ldr r0, addressOfNewline    // last new line   
    bl printf
    ldr lr, [sp], #+4           // pop the lr from the stack
    bx lr


.global main
.global printf

addressOfI: .word i
addressOfJ: .word j
addressOfOuterLength: .word outer_length
addressOfInner1Length: .word inner1_length
addressOfInner2Length: .word inner2_length
addressOfBaseLength: .word base_length
addressOfStars: .word stars
addressOfSpaces: .word spaces
addressOfNewline: .word newline



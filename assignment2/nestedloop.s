// This is a program in ARM assembly that will print a triangle of 
// given size to print to the screen

.data

i: .word 0
j: .word 0
outer_length: .word 7
inner1_length: .word 8
inner2_length: .word 0
base_length: .word 8

stars:  .asciz  "*"
spaces: .asciz  "+"
newline: .asciz "\n"


.text
main: 
    str lr, [sp, #-4]!          // push the lr to the stack
    b outer_loop 

outer_loop:
    
    ldr r0, addressOfStars
    bl printf

    ldr r1, addressOfI
    ldr r2, addressOfOuterLength
    ldr r3, [r1]
    add r3, r3, #1              // make the increment
    str r3, [r1]
    ldr r4, [r2]

inner1_loop:
     
    ldr r1, addressOfI
    ldr r2, addressOfInner1Length
    ldr r3, [r1]
    ldr r4, [r2]

    ldr r0, addressOfStars
    bl printf

    ldr r1, addressOfJ
    ldr r2, addressOfInner1Length
    ldr r3, [r1]
    ldr r4, [r2]
    add r3, r3, #1
    str r3, [r1]


inner2_loop:
    
    ldr r1, addressOfI
    ldr r2, addressOfInner2Length
    ldr r3, [r1]
    mov r4, r3, lsl#1
    str r4, [r2]
    

    ldr r0, addressOfSpaces
    bl printf

    ldr r1, addressOfJ
    ldr r2, addressOfInner2Length
    ldr r3, [r1]
    add r3, r3, #1
    ldr r4, [r2]
    str r3, [r1]
    


inner2_loop_mid:
    cmp r3, r4
    blt inner2_loop

inner1_loop_mid:
    cmp r3, r4
    blt inner1_loop
    
outer_loop_mid:
    cmp r3, r4                  // first run, 0 < 8, second run 1 < 8 and so on
    blt outer_loop

// end of outter loop this is the last line before it goes to the base
// -----------------------------------------------------------------------------------------------
    

// -----------------------------------------------------------------------------------------------
// create the base 
base:
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



/* This is just the C code to give me an idea of what I want it to look like
@ for(i = 0, i < rows - 1, i++) // got this

    @ for(j = 1, j < rows - i, j++)

        @ printf(" ")

    @ for(j = 0, j <= 2*i, j++)

        @ if j == 0 or j == 2 * i
        
            @ printf("*")

        @ else 
        
            @ printf(" ")

    @ printf("\n")  // when it gets here it will start loop again
@ end of first for loop
*/


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



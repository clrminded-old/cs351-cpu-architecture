// This is a program in ARM assembly that will print a triangle of 
// given size to print to the screen

.data

i: .word 0
j: .word 0
rows: .word 8

stars:  .asciz  "*"
spaces: .asciz  " "
newline: .asciz "\n"

/*
 * design of printing triangle:
 * it will be a fixed size triangle of height 8
 * since it is a fixed size, we dont need any parameters or returns
 * we dont even need a function to do this
 * remember that we need str commands for every assignment operation
 * since the for loop reassign values for i, space, rows, symbols we 
 * need at least 4 str commands
 * variable for "rows" doesnt change
 */

.text
main: 
    str lr, [sp, #-4]!          // push the lr to the stack
    ldr r1, addressOfi 
    ldr r2, addressOfrows
    ldr r3, [r1]
    ldr r4, [r2]
    str r3, [r1]
    sub r4, r4, #1
    b outer_test

outer_loop:
    ldr r0, addressOfstars
    bl printf                   // prints a * character

    // This is where the next loop is going to go
    // If I think of this correctly, I may need to push and pop from the stack 
    // again here...

    ldr r0, addressOfnewline
    bl printf                   // prints a newline

    ldr r1, addressOfi
    ldr r3, [r1]                // load value of i into r3
    add r3, r3, #1              // add 1 to r4
    str r3, [r1]                //  str r4 into value of r1 so i should = 2
    
outer_test:
    cmp r3, r4                  // first run, 1 < 8, second run 2 < 8 and so on
    blt outer_loop




























// create the base 
// since this is the loop of the code and will end here
// im going to move this down temporarly
base:
    ldr r1, addressOfi          // at this point i has a value of 8, so we need to reset
    ldr r2, addressOfrows       // load up values of rows
    ldr r3, [r1]                // value in r1 is 8, we will load it into r3
    mov r4, #0                  // mov a 0 into r4, this is what we will replace the 8 with
    str r4, [r1]                // store 0 back into memory for the value of r1
    ldr r4, [r2]                // replace r4 with the value in r2
    mov r4, r4, lsl #1          // doubling 8 is 16 meaning we can bitshift to the left 1 time
    sub r4, r4, #1              // subtract 1 to meet conditional we want for the base
    b base_test

base_loop:
    ldr r0, addressOfstars
    bl printf

    ldr r1, addressOfi
    ldr r3, [r1]
    add r3, r3, #1
    str r3, [r1]

base_test:
    cmp r3, r4
    blt base_loop


end:
    ldr r0, addressOfnewline    // last new line   
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

addressOfi: .word i
addressOfj: .word j
addressOfrows: .word rows
addressOfstars: .word stars
addressOfspaces: .word spaces
addressOfnewline: .word newline



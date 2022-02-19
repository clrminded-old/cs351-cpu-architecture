// This is a program in ARM assembly that will print a triangle of 
// given size to print to the screen

.data

i: .word 0
j: .word 0
rows: .word 8

stars:  .asciz  "*"
spaces: .asciz  "+"
newline: .asciz "\n"


.text
main: 
    str lr, [sp, #-4]!          // push the lr to the stack
    ldr r1, addressOfi          // load address of i into r1
    ldr r2, addressOfrows       // placing address of rows into r2
    ldr r3, [r1]                // load 0 ( value in r1 ) into r3
    ldr r4, [r2]                // load 8 ( value in r2 ) into r4
    str r3, [r1]                // this assigns 0 to i
    sub r4, r4, #1              // subtract 1 from rows, this is the conditional for the outer loop
    b outer_loop_mid            // branch to outer_test label

outer_loop:
  
    ldr r5, addressOfj          
    ldr r6, addressOfrows
    ldr r7, [r5]
    ldr r8, [r6]
    str r7, [r5]
    sub r8, r8, r3

    b inner1_loop

    ldr r0, addressOfstars
    bl printf

    ldr r0, addressOfnewline
    bl printf
    
    ldr r1, addressOfi
    ldr r3, [r1]
    add r3, r3, #1
    str r3, [r1]
    
    b inner1_loop_mid

inner1_loop:
    
    ldr r5, addressOfj
    ldr r7, [r5]
    ldr r8, [r8]
    
    ldr r0, addressOfspaces
    bl printf

    ldr r5, addressOfj
    ldr r7, [r5]
    ldr r8, [r8]
    add r7, r7, #1
    str r7, [r5]
    
    b inner1_loop_mid

inner1_loop_mid:
    cmp r7, r8
    blt inner1_loop

inner1_loop_end:
    ldr r0, addressOfnewline
    bl printf

outer_loop_mid:
    cmp r3, r4                  // first run, 0 < 8, second run 1 < 8 and so on
    blt outer_loop

outer_loop_end:
    ldr r0, addressOfnewline
    bl printf                   // when outer loop ends, it will move down to the base loop
    

// -----------------------------------------------------------------------------------------------
// create the base 
base:
    ldr r1, addressOfi          // at this point i has a value of 8, so we need to reset
    ldr r2, addressOfrows       // load up values of rows
    ldr r3, [r1]                // value in r1 is 8, we will load it into r3
    mov r4, #0                  // mov a 0 into r4, this is what we will replace the 8 with
    str r4, [r1]                // store 0 back into memory for the value of r1
    ldr r4, [r2]                // replace r4 with the value in r2
    mov r4, r4, lsl #1          // doubling 8 is 16 meaning we can bitshift to the left 1 time
    sub r4, r4, #1              // subtract 1 to meet conditional we want for the base
    b base_mid

base_loop:
    ldr r0, addressOfstars
    bl printf

    ldr r1, addressOfi
    ldr r3, [r1]
    add r3, r3, #1
    str r3, [r1]

base_mid:
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



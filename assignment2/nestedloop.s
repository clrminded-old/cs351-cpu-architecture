@ This is a program in ARM assembly that will print a triangle of 
@ given size to print to the screen

.data

i: .word 0
j: .word 0
rows: .word 8

stars:  .asciz  "*"
spaces: .asciz  " "
newline: .asciz "\n"


@ design of printing triangle:
@ it will be a fixed size triangle of height 8
@ since it is a fixed size, we dont need any parameters or returns
@ we dont even need a function to do this
@ remember that we need str commands for every assignment operation
@ since the for loop reassign values for i, space, rows, symbols we 
@ need at least 4 str commands
@ variable for "rows" doesnt change


.text
main: 
    str lr, [sp, #-4]!  @ push the lr to the stack
    ldr r1, addressOfi 
    ldr r2, addressOfrows
    ldr r3, [r1]
    ldr r4, [r2]
    str r3, [r1]
    sub r4, r4, #1
    
    b test

loop:
    ldr r0, addressOfstars
    bl printf               @ print the star

    ldr r0, addressOfnewline
    bl printf

    ldr r1, addressOfi
    ldr r3, [r1]        @load value of i into r4
    add r3, r3, #1      @ add 1 to r4
    str r3, [r1]        @ str r4 into value of r1 so i should = 2
    
test:
    cmp r3, r4     @first run, 1 < 8, second run 2 < 8 and so on
    blt loop

// create the base
base:
    ldr r1, addressOfi
    ldr r2, addressOfrows
    ldr r3, [r1]
    mov r4, #0
    str r4, [r1]
    ldr r4, [r2]
    
    mov r4, r4, lsl #1
    sub r4, r4, #1
    
    b test2

base_loop:
    ldr r0, addressOfstars
    bl printf

    ldr r1, addressOfi
    ldr r3, [r1]
    add r3, r3, #1
    str r3, [r1]

test2:
    cmp r3, r4
    blt base_loop


end:
    ldr r0, addressOfnewline    @ last new line   
    bl printf
    ldr lr, [sp], #+4           @ pop the lr from the stack
    bx lr















@ for(i = 0, i < rows - 1, i++)

    @ for(j = 1, j < rows - i, j++)

        @ printf(" ")

    @ for(j = 0, j <= 2*i, j++)

        @ if j == 0 or j == 2 * i
        
            @ printf("*")

        @ else 
        
            @ printf(" ")

    @ printf("\n")
@ end of first for loop



@ creates the base row of "*" symbols
@str r1, #0                  @ initiate variable i back to 0
@ for(i = 0, i < 2 * rows - 1, i++)
@    @printf("*")
@printf("\n")

.global main
.global printf

addressOfi: .word i
addressOfj: .word j
addressOfrows: .word rows
addressOfstars: .word stars
addressOfspaces: .word spaces
addressOfnewline: .word newline



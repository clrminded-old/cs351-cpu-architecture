/* This is a program in ARM assembly that will
   print a triangle of given size to print to
   the screen.

   This project was completed by Mohamed Elfergani
   and Christopher Liudahl-Rackley.

   CS351 - CPU architecture
*/

.data

i: .word 1
j: .word 0
space: .word 0
rows: .word 8

stars:  .asciz  "*"
spaces: .asciz  " "
newline: .asciz "\n"


.text
main:

    str lr, [sp, #-4]!          // push to stack
 
loop0:

    ldr r1, addressOfI
    ldr r2, addressOfRows
    ldr r3, [r1]                // get i
    ldr r4, [r2]                // get rows

    cmp r3, r4
    bgt done                    // if i > rows go to done

    ldr r1, addressOfI
    ldr r2, addressOfJ
    ldr r3, [r1]                // get i
    ldr r4, [r2]                // get j
    mov r4, r3
    str r4, [r2]                // j = i

loop1:

    ldr r1, addressOfJ          
    ldr r2, addressOfRows
    ldr r3, [r1]                // get j
    ldr r4, [r2]                // get rows
    
    cmp r3, r4
    bge loop2_start             // if j >= rows go to loop2 start

    ldr r0, addressOfSpaces
    bl printf                   // print a space character

loop1_end:

    ldr r1, addressOfJ
    ldr r2, [r1]                // get j
    add r2, r2, #1              // j + 1
    str r2, [r1]                // j = j + 1
    b loop1

loop2_start:

    ldr r1, addressOfI
    ldr r2, addressOfJ
    ldr r3, addressOfRows
    ldr r4, [r1]                // get i
    ldr r5, [r2]                // get j
    ldr r6, [r3]                // get rows
    mov r5, #1                  // put 1 into r5
    str r5, [r2]                // j = 1

loop2:

    ldr r1, addressOfI      
    ldr r2, addressOfJ
    ldr r5, [r2]                // get j
    ldr r7, [r1]                // get i
    mov r7, r7, lsl#1           // i * 2
    sub r7, r7, #1              // i * 2 - 1
    
    cmp r5, r7
    bgt loop0_end               // if i > j go to loop0_end

    ldr r1, addressOfI
    ldr r2, addressOfJ
    ldr r3, addressOfRows
    ldr r4, [r1]                // get i
    ldr r5, [r2]                // get j
    ldr r6, [r3]                // get rows
    
    cmp r4, r6
    beq print_star              // if i == rows print star
    
    cmp r5, #1
    beq print_star              // if j == 1 print star

    cmp r5, r7
    beq print_star              // if j == i * 2 - 1 print star

    bne print_space             // otherwise print space

print_space:

    ldr r0, addressOfSpaces
    bl printf                   // prints space
    b loop2_end

print_star:

    ldr r0, addressOfStars
    bl printf                   // prints star
    b loop2_end

loop2_end:

    ldr r1, addressOfJ
    ldr r2, [r1]                // get j
    add r2, r2, #1              // j + 1
    str r2, [r1]                // j = j + 1
    b loop2
     
loop0_end:

    ldr r0, addressOfNewline
    bl printf                   // print new line
    ldr r1, addressOfI
    ldr r2, [r1]                // get i 
    add r2, r2, #1              // i + 1
    str r2, [r1]                // i = i + 1
    b loop0    

done:
    ldr lr, [sp], #+4           // pop from stack
    bx lr                       // end program

.global main
.global printf

addressOfI: .word i
addressOfJ: .word j
addressOfSpace: .word space
addressOfRows: .word rows
addressOfStars: .word stars
addressOfSpaces: .word spaces
addressOfNewline: .word newline

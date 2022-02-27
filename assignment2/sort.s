/* This is an ARM assembly program that implements
   a sorting algorithm on an array of numbers. The
   output is a list of the numbers in the array in
   ascending order.

   This project was completed by Mohamed Elfergani
   and Christopher Liudahl-Rackley

   CS351 - CPU architecture
*/

.data
arr:
        .word   99
        .word   2
        .word   1
        .word   54
        .word   607

n:      .word   5
i:      .word   0
j:      .word   0
key:    .word   0
temp:   .word   0

p2: .asciz "%d "
newline:    .asciz "\n"

.text

main:

    str lr, [sp, #-4]!
    bl sort
    bl print
    ldr lr, [sp], #+4
    bx lr

sort:

    str lr, [sp, #-4]!
    ldr r1, addressOfI
    mov r2, #1
    str r2, [r1]

loop0:

    ldr r1, addressOfI     
    ldr r2, addressOfN     
    ldr r3, [r1]
    ldr r4, [r2]
    
    cmp r3, r4
    bge done 

    ldr r1, addressOfArr    
    ldr r2, addressOfI
    ldr r2, [r2]
    add r3, r1,r2,LSL #2
    ldr r3, [r3]
    ldr r4, addressOfKey
    str r3, [r4]          
   
    ldr r1, addressOfI
    ldr r1, [r1]
    sub r2, r1, #1
    ldr r3, addressOfJ
    str r2, [r3]       
  

first_check:

    ldr r1, addressOfJ
    ldr r2, [r1]
    cmp r2, #0
    blt loop0_end 
   
second_check:

    ldr r1, addressOfArr
    ldr r2, addressOfJ
    ldr r2, [r2]
    add r3, r1,r2,LSL #2 
    ldr r3, [r3]
    ldr r4, addressOfKey
    ldr r4, [r4]       

    cmp r3, r4             
    bgt swap
    b loop0_end

swap:
    
    ldr r1, addressOfArr
    ldr r2, addressOfJ
    ldr r2, [r2]          
    add r3, r1,r2,LSL #2
    ldr r3, [r3]          
    
    add r2,r2,#1
    add r4, r1,r2,LSL #2
    str r3, [r4]
    
    sub r2,r2,#1
    
    ldr r1, addressOfJ
    ldr r2, [r1]
    sub r2,r2, #1
    str r2, [r1]
    
    b first_check

loop0_end:

    ldr r1, addressOfArr
    ldr r2, addressOfJ
    ldr r2,[r2]
    add r2,r2,#1
    add r3, r1,r2,LSL #2
    
    ldr r4, addressOfKey
    ldr r4,[r4]
    str r4, [r1,r2, LSL #2]
    
    ldr r1, addressOfI
    ldr r2,[r1]
    add r2,r2,#1
    str r2,[r1]
    b loop0                
    
done:

    ldr lr, [sp], #+4
    bx lr

print:

    str lr, [sp, #-4]!

    ldr r1, addressOfArr
    ldr r2, addressOfI
    mov r3, #0
    str r3, [r2]
    b test

loop:

    ldr r1, addressOfArr
    ldr r2, addressOfI
    ldr r3, [r2]
    
    ldr r0, addP2
    ldr r1, [r1, r3, LSL #2]
    bl printf

    ldr r2, addressOfI
    ldr r3, [r2]
    add r3, r3, #1
    str r3, [r2]

test:

    ldr r3, [r2]
    ldr r4, addressOfN
    ldr r4, [r4]
    cmp r3, r4
    blt loop

    ldr r0, addressOfNewline
    bl printf

    ldr lr, [sp], #+4
    bx lr


.global main
.global printf

addressOfArr: .word arr
addressOfN: .word n
addressOfI: .word i
addressOfJ: .word j
addressOfKey: .word key
addP2: .word p2
addressOfNewline: .word newline
addTemp: .word temp

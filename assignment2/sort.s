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
        .word   1
        .word   17
        .word   34
        .word   51
        .word   67

n:      .word   5
i:      .word   0
j:      .word   0
key:    .word   0
temp:   .word   0

p2: .asciz "%d "
newline:    .asciz "\n"

.text

main:

    str lr, [sp, #-4]!      // pushes to stack
    bl sort                 // starts sort, when sort ends returns back here
    bl print                // when sort ends, print starts
    ldr lr, [sp], #+4       // pops from stack  
    bx lr                   // program ends

sort:

    str lr, [sp, #-4]!      // push to stack
    ldr r1, addressOfI
    mov r2, #1              
    str r2, [r1]            // i = 1

loop0:

    ldr r1, addressOfI     
    ldr r2, addressOfN     
    ldr r3, [r1]            // get i    
    ldr r4, [r2]            // get n
    
    cmp r3, r4
    bge done                // if i < n continue, otherwise branch to done

    ldr r1, addressOfArr    
    ldr r2, addressOfI
    ldr r2, [r2]            // get i
    add r3, r1,r2,LSL #2    
    ldr r3, [r3]            // get arr[i]
    ldr r4, addressOfKey
    str r3, [r4]            // key = arr[i]
   
    ldr r1, addressOfI
    ldr r1, [r1]            // get i
    sub r2, r1, #1          // i - 1
    ldr r3, addressOfJ      
    str r2, [r3]            // j = i - 1
  

first_check:

    ldr r1, addressOfJ
    ldr r2, [r1]            // get j
    cmp r2, #0              // if j >= 0 continue, otherwise goto loop0_end
    blt loop0_end 
   
second_check:

    ldr r1, addressOfArr    
    ldr r2, addressOfJ
    ldr r2, [r2]            // get j
    add r3, r1,r2,LSL #2    
    ldr r3, [r3]            // arr[j]
    ldr r4, addressOfKey
    ldr r4, [r4]            // get key

    cmp r3, r4              
    bgt swap                // if arr[i] > key continue, otherwise goto loop0_end
    b loop0_end

swap:
    
    ldr r1, addressOfArr
    ldr r2, addressOfJ
    ldr r2, [r2]            // get j
    add r3, r1,r2,LSL #2
    ldr r3, [r3]            // arr[j]
    
    add r2,r2,#1            // j + 1
    add r4, r1,r2,LSL #2
    str r3, [r4]            // arr[j+1] = arr[j]
    
    sub r2,r2,#1            // bring j+1 back to j
    
    ldr r1, addressOfJ      
    ldr r2, [r1]            // get j
    sub r2,r2, #1           // j - 1
    str r2, [r1]            // j = j - 1
    
    b first_check           // goto first_check

loop0_end:

    ldr r1, addressOfArr
    ldr r2, addressOfJ
    ldr r2,[r2]             // get j
    add r2,r2,#1            // j + 1
    add r3, r1,r2,LSL #2    // arr[j+1]
    
    ldr r4, addressOfKey
    ldr r4,[r4]             // get key
    str r4, [r1,r2, LSL #2] // arr[j+1] = key
    
    ldr r1, addressOfI
    ldr r2,[r1]             // get i
    add r2,r2,#1            // i + 1
    str r2,[r1]             // i = i + 1
    b loop0                
    
done:

    ldr lr, [sp], #+4       // pop from stack
    bx lr                   // end sort function

print:

    str lr, [sp, #-4]!      // push to stack

    ldr r1, addressOfArr
    ldr r2, addressOfI
    mov r3, #0              
    str r3, [r2]            // i = 0
    b test

loop:

    ldr r1, addressOfArr
    ldr r2, addressOfI
    ldr r3, [r2]            // get i
    
    ldr r0, addP2
    ldr r1, [r1, r3, LSL #2]
    bl printf               // print arr[i]

    ldr r2, addressOfI
    ldr r3, [r2]            // get i
    add r3, r3, #1          
    str r3, [r2]            // i = i + 1

test:

    ldr r3, [r2]            // get i
    ldr r4, addressOfN
    ldr r4, [r4]            // get n
    cmp r3, r4
    blt loop                // if i < n goto loop, otherwise continue

    ldr r0, addressOfNewline    
    bl printf               // print a new line for formatting

    ldr lr, [sp], #+4       // pop from stack
    bx lr                   // end print function


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

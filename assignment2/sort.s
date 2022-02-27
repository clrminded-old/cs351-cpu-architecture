.data
arr:
        .word   67
        .word   51
        .word   34
        .word   17
        .word   1

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
    ldr r1, addressOfI      // r1 <- *i
    ldr r2, addressOfN      // r2 <- *n
    ldr r3, [r1]
    ldr r4, [r2]
    
    cmp r3, r4
    bge done 

    // i and n are printing out correctly
    // going into parent loop


    ldr r1, addressOfArr        // no change is happening here
    ldr r2, addressOfI
    ldr r3, addressOfJ          // something is wrong here
    ldr r4, addressOfKey        // something is wrong here
    ldr r5, [r4]
    ldr r6, [r3]
    ldr r7, [r2]
    ldr r8, [r1]
    /* r5 -> keys are printing out 0 and a bunch of addresses afterwards
       r6 -> j, is printing out 0 0 1 2 3, meaning something is going wrong
             after the 1st iteration...
       r7 -> i is printing out correctly
       r8 -> as for the first item in the array does not change, when arr[0]
             is 1, prints out 1 1 1 1 1, when arr[0] is 67, prints out
             67 67 67 67 67
    */

    add r5, r1,r7,LSL #2    // get arr[i]
    ldr r5, [r5]
    str r5, [r4]            // key = arr[i]

    ldr r0, addP2
    mov r1, r5
    bl printf
    // from r5 we are getting 51, 34, 17, 1 which is what want...

    ldr r1, addressOfArr        // no change is happening here
    ldr r2, addressOfI
    ldr r3, addressOfJ          // something is wrong here
    ldr r4, addressOfKey        // something is wrong here
    ldr r5, [r4]
    ldr r6, [r3]
    ldr r7, [r2]
    ldr r8, [r1]
  
    sub r7, r7, #1          // i--
    str r7, [r3]            // j = i - 1

    


first_check:
    ldr r1, addressOfJ
    ldr r2, [r1]
    cmp r2, #0
    blt loop0_end
    // From here i is 1 2 3 4 5 and j 0 1 2 3 4
    

second_check:
    ldr r1, addressOfArr
    ldr r2, addressOfJ
    ldr r3, addressOfKey
    ldr r4, [r3]            // key->r4
    ldr r5, [r2]            // j-> r5
    add r6, r1,r5,LSL #2    // arr[j]->r6
    cmp r6, r4
    ble loop0_end

    /* The key is getting an address, when there should be a value...
       j is getting the correct looking results 
       and r6 is printing  1 1 2 3 4????*/

swap:
    ldr r1, addressOfArr
    ldr r2, addressOfJ
    ldr r3, [r2]            // for arr[j]
    ldr r4, [r2]            // for arr[j+1]
    add r4, r4, #1
    str r4, [r1,r3,LSL #2]
    ldr r2, addressOfJ
    ldr r3, [r2]
    sub r3, r3, #1
    str r3, [r2]
    b first_check
    

loop0_end:
    ldr r1, addressOfArr
    ldr r2, addressOfJ
    ldr r3, addressOfKey
    ldr r4, [r3]
    ldr r5, [r2]
    add r5, r5, #1          // j + 1
    add r6, r1,r5,LSL #2
    str r5, [r6]            // arr[j+1] = key
    
    ldr r1, addressOfI
    ldr r2, [r1]
    add r2, r2, #1
    str r2, [r1]            // i++
    b loop0                 // go back to top of loop
    

done:
    ldr lr, [sp], #+4
    bx lr

// print function
print:
    str lr, [sp, #-4]!

    ldr r1, addressOfArr
    ldr r2, addressOfI
    ldr r3, [r2]
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
// end of print function

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

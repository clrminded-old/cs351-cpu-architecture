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
    str lr, [sp, #-4]!
    bl sort
    bl print
    ldr lr, [sp], #+4
    bx lr

sort:
    str lr, [sp, #-4]!
loop0:
    ldr r1, addressOfI
    ldr r2, addressOfN
    mov r3, #1
    str r3, [r1]
    ldr r4, [r2]
    
    cmp r3, r4
    bgt done 
    // going into parent loop
    ldr r1, addressOfArr
    ldr r2, addressOfI
    ldr r3, [r2]
    add r4, r1,r3,LSL #2    arr[i]
    ldr r5, addressOfKey
    str r4, [r5]            // key = arr[i]
    ldr r6, addressOfJ
    sub r3, r3, #1
    str r3, [r6]            // j = i - 1

first_check:
    ldr r1, addressOfJ
    ldr r2, [r1]
    cmp r2, #0
    blt loop0_end

second_check:
    ldr r1, addressOfArr
    ldr r2, addressOfJ
    ldr r3, addressOfKey
    ldr r4, [r3]            // key->r4
    ldr r5, [r2]            // j-> r5
    add r6, r1,r5,LSL #2    // arr[j]->r6

    cmp r6, r4
    ble loop0_end

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

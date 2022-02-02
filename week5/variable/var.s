.data                   @ Data section
.balign 4               @ byte alignment (we want word alignment so we put 4)

x:                      @ create a variable called x which is an integer
    .word 0             @ initializing the x variable to 0

y:                      @ create a variable y, which is an integer
    .word 0             @ since it is an integer which is 4 bytes 1 word in size and initialized to 0

.text                   @ Text section
.global main            @ create a global label called main

main:                   @ this label refers to an address and it is the start of the first instruction
    mov r1, #13         @ Place 13 into register 1
    ldr r2, addressOfX  @ place the address of the x variable in data section into register r2
    str r1, [r2]        @ r2 is and address, [r2] is dereferencing and taking the VALUE in r2 and placing it in r1
                        @ we are storing the number that is in r1 and putting it in an address location


    mov r1, #14         @ place 14 in r1, this is overwriting the value currently in r1
    ldr r3, addressOfY  @ 
    str r1, [r3]

    ldr r4, [r2]
    ldr r5, [r3]
    add r0, r4, r5

    bx lr

addressOfX: .word x     @ pointers to the address of the x variable in data section
addressOfY: .word y     @ pointer to the address of y variable in data section

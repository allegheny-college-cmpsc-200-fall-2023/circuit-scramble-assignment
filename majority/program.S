.thumb_func
.global main

.include "not.S"

main:
    BL      stdio_init_all
    @ TODO:
    @   * Setup the offset counter
    @   * load the size of array to a register
    @   * load the memory location of the array to register

load_triplet:
    @ TODO: Load votes from memory as a "triplet" (i.e. group of 3 values) 
    @       to 3 separate registers

evaluate:
    @ TODO: _After_ evaluating the truth table to develop the boolean expression
    @       for this circuit, implement the stages of the circuit as combinations
    @       of logical statements
    
    @ TODO: Determine whether to print TRUE or FALSE

print_false:
    @ TODO: Load FALSE message to register

print_true:
    @ TODO: Load TRUE message to register

print:
    @ TODO: Print outcome of _each_ row of truth table using the format string
    @       and correct "truthy" value (i.e. correct string)

boundary:
    @ TODO: Determine if we've hit the end of the array and branch appropriately

finish:
    NOP
    B       finish

.data
    format:     .asciz  "IS MAJORITY: %s\n"
    true:       .asciz  "TRUE"
    false:      .asciz  "FALSE"
    votes:      .byte   0, 0, 0
                .byte   0, 0, 1
                .byte   0, 1, 0
                .byte   0, 1, 1
                .byte   1, 0, 0
                .byte   1, 0, 1
                .byte   1, 1, 0
                .byte   1, 1, 1
    end:
    .set        size, end - votes
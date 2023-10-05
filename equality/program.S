.thumb_func
.global main

.include "not.S"

main:
    BL      stdio_init_all
    @ TODO: Set an arbitrary register to a #0 for counting
    @ TODO: Load size memory location into arbitrary register
    @ TODO: Load elements memory location into arbitrary register
    
load_pair:
    @ TODO: Compare array size to offset and branch to finish when appropriate
    @ TODO: Load a byte to arbitrary register
    @ TODO: Increment offset
    @ TODO: Load a byte to arbitrary register

test_equality:
    @ TODO: Store bytes independently to retain for logical op
    @ TODO: Perform NOTs and their comparison according to circuit
    @ TODO: Perform AND of A, B
    @ TODO: Implement (Not A and Not B) OR (A and B)
    @ TODO: Load format into R0
    @ TODO: Move final value calculated from digital logic to R1
    @ TODO: Print result
    
    @ TODO: Increment offset once more to get to offset + 2

    @ TODO: Unconditional branch to load_pair

finish:
    NOP
    B       finish

.data
    format:     .asciz  "OUTPUT: %d\n"
    elements:   .byte   0, 0, 0, 1, 1, 0, 1, 1
    end:
    .set        size, end - signals
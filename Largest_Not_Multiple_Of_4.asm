.data
prompt_for_input: .asciiz "Please enter your numbers, pressing enter after each, (0 to terminate):\n"
prompt_for_output: .asciiz "Your quantity of interest is equal to: "

.text
main:
# prompting the user with a message for a string input:
li $v0, 4
la $a0, prompt_for_input
syscall

li  $s0, 0
LOOP: 
li  $v0, 5
syscall 

# checking if it is divislble by 4
addi $t0, $zero, 4 # Set divisor to 4
div $v0, $t0
mfhi $t0           # Save remainder
beq $t0, $zero, CONTINUE #if it is divisible by 4, branches to continue

beq $s0, $zero, LOAD
#if the number already stored is larger continue the loop
bgt $s0, $v0, CONTINUE

LOAD:
#load v0 into s0
move $s0, $v0

CONTINUE:
bne $v0, $zero, LOOP

# prompting the user with a message for the processed output:
li $v0, 4
la $a0, prompt_for_output
syscall


# printing the output
addiu  $v0, $zero, 1
addu $a0, $zero, $s0
syscall

# Finish the programme:
li $v0, 10      # syscall code for exit
syscall         # exit


even_or_odd:
        addi $t0, $zero, 2 # Set divisor to 2
        div $a0, $t0
        mfhi $t0           # Save remainder
        beq $t0, $zero, even
        j odd
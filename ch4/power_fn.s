# Implementation of power function for natural numbers
#
# Author: Anshu Avinash

.section .data

.section .text
.globl _start

# Calculate 2^3 + 3^2
_start:
  pushl $3          # Push second argument
  pushl $2          # Push first argument
  call power
  addl $8, %esp     # Remove arguments from stack
  pushl %eax        # Save the first answer
  pushl $2
  pushl $3
  call power
  addl $8, %esp
  popl %ebx         # Second answer in eax
  addl %eax, %ebx   # Store result in ebx
  movl $1, %eax
  int $0x80         # Return result in exit value

# Definition of function power
#
# First Argument: base
# Second Argument: the power to raise to

.type power, @function
power:
  pushl %ebp
  movl %esp, %ebp
  subl $4, %esp
  
  movl 8(%ebp), %ebx
  movl 12(%ebp), %ecx
  movl %ebx, -4(%ebp)

  power_loop_start:
    cmpl $1, %ecx
    je end_power
    movl -4(%ebp), %eax
    imull %ebx, %eax
    movl %eax, -4(%ebp)
    decl %ecx
    jmp power_loop_start

  end_power:
    movl -4(%ebp), %eax
    movl %ebp, %esp
    popl %ebp
    ret 

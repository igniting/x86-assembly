# Program to return an exit code to Linux Kernel
#
# Author: Anshu Avinash

# Anything starting with period is an assembly directive
# In data section, we can list any memory storage we need
.section .data

# Program instructions live in text section
.section .text

# Start is a symbol
# .globl tells that assembler should not disregard this symbol after assembling
.globl _start

# _start label
_start:
  # Storing the system call number for exit in general purpose register eax
  movl $1, %eax
  # Return value 0 in ebx
  movl $0, %ebx
  # Make the system call
  int $0x80

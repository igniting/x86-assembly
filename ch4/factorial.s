# Recursive implementation of factorial function
#
# Author: Anshu Avinash

.section .data

.section .text
.globl _start

_start:
  pushl $5
  call factorial
  subl $4, %esp
  movl %eax, %ebx
  movl $1, %eax
  int $0x80

.type factorial, @function

factorial:
  pushl %ebp
  movl %esp, %ebp
  movl 8(%ebp), %eax
  subl $4, %esp
  cmpl $1, %eax
  je end_factorial
  movl %eax, -4(%ebp)
  decl %eax
  pushl %eax
  call factorial
  subl $4, %esp
  movl -4(%ebp), %ebx
  imull %ebx, %eax
  
  end_factorial:
    movl %ebp, %esp
    popl %ebp
    ret 

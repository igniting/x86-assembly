# Program to calculate maximum from a list of numbers, terminated by 0
#
# Registers used:
#   %eax - Current data item
#   %ebx - Maximum data item
#   %edi - Current index
#
# Author: Anshu Avinash

.section .data

data_items:
  .long 3, 6, 1, 2 , 5, 9, 0

.section .text
.globl _start

_start:
  movl $0, %edi
  movl data_items(, %edi, 4), %eax
  movl %eax, %ebx

  start_loop:
    cmpl $0, %eax
    je loop_exit
    incl %edi
    movl data_items(, %edi, 4), %eax
    cmpl %ebx, %eax
    jle start_loop
    movl %eax, %ebx
    jmp start_loop

  loop_exit:
    movl $1, %eax
    int $0x80

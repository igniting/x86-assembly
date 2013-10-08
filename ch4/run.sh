#!/bin/bash
as $1.s --32 -o $1.o
ld $1.o -m elf_i386 -o $1
./$1
echo "Result: " $?
rm -f $1.o $1

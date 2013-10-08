#!/bin/bash
as power_fn.s --32 -o power_fn.o
ld power_fn.o -m elf_i386 -o power_fn
./power_fn
echo "Result: " $?
rm -f power_fn.o power_fn

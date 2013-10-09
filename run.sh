#!/bin/bash
if [ $1 ]; then
  if [ -f $1.s ]; then
    as $1.s --32 -o $1.o
    ld $1.o -m elf_i386 -o $1
    ./$1
    echo "Result: " $?
    rm -f $1.o
  else
    echo "$1.s doesn't exist."
  fi
else
  echo "Usage:" $0 "file_name(without_extension)"
fi

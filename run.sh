#!/bin/bash
# run file

nasm -f elf32 hw11translate2Ascii.asm -o hw11translate2Ascii.o || exit 1
ld -m elf_i386 hw11translate2Ascii.o -o hw11translate2Ascii || exit 1
./hw11translate2Ascii

if [ $? -ne 0 ]; then
    echo "error: program execution failed"
    exit 1
fi

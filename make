#! /bin/bash
nasm -f bin "$1" -o os.bin
qemu-system-x86_64 -fda "os.bin" -boot c

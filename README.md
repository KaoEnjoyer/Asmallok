
### Toolchain
* Nasm
* Gcc

### How to Build
Run:
` nasm -f elf64 mallok.asm -o mallok.o -g
` gcc -o test main.c mallok.o -g

If u want to just include it in your project

Add `extern void* _mall_ok(uint8_t size)` to your .c file
and remember to link mallok.o file 

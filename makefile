test: test.o
	gcc -m64 -o test test.o
test.o: test.asm
	nasm -f elf64 -l test.lst test.asm

kangaroo: kangaroo.o
	gcc -m64 -o kangaroo kangaroo.o
kangaroo.o: kangaroo.asm
	nasm -f elf64 -l kangaroo.lst kangaroo.asm

makeUppercase: makeUppercase.o
	ld -o makeUppercase makeUppercase.o
makeUppercase.o: makeUppercase.asm
	nasm -f elf64 -g -F stabs makeUppercase.asm


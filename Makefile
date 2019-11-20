CC = gcc
FASM = fasm
LDFLAGS = -static

PHONY: clean

all: asm_sort c_sort

clean:
	rm *.o asm_sort c_sort -rf

c_sort: main.c func_sofiia_sort.o
	$(CC) $^ -o $@

asm_sort: func_sofiia_sort.o sofia_sort.o
	$(CC) $(LDFLAGS) $^ -o $@

sofia_sort.o: sofia_sort.asm
	$(FASM)  $<

func_sofiia_sort.o: func_sofiia_sort.asm
	$(FASM)  $<

c_sort: main.c
	$(FASM) $(ASMFUNCFILE)
	$(CC) $^
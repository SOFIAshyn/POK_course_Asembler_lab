CC = gcc
FASM = fasm
LDFLAGS = -static

PHONY: clean

all: asm_sort c_sort

clean:
	rm *.o asm_sort c_sort -rf

# create obj file for 'func_sofiia_sort'
func_sofiia_sort.o: func_sofiia_sort.asm
	$(FASM) $<

# create obj file for 'sofia_sort'
sofia_sort.o: sofia_sort.asm
	$(FASM)  $<

# create obj file for both object files
asm_sort: sofia_sort.o func_sofiia_sort.o
	$(CC) $(LDFLAGS) $^ -o $@

# create obj file for main object file and c
c_sort: main.c func_sofiia_sort.o
	$(CC) $^ -o $@
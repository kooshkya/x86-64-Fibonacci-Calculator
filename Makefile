ASM = nasm
CC = gcc
ASM_FLAGS = -f elf64
CC_FLAGS = -nostartfiles -no-pie

DEBUG_ASM_FLAGS = -f elf64 -g -F dwarf
DEBUG_CC_FLAGS = -nostartfiles -no-pie -g

SRC = fib.asm
OBJ = fib.o
EXEC = fib

all: $(EXEC)

$(OBJ): $(SRC)
	$(ASM) $(ASM_FLAGS) -o $@ $(SRC)

$(EXEC): $(OBJ)
	$(CC) $(CC_FLAGS) -o $@ $(OBJ)

debug: clean
	$(MAKE) ASM_FLAGS="$(DEBUG_ASM_FLAGS)" CC_FLAGS="$(DEBUG_CC_FLAGS)" all

clean:
	rm -f $(OBJ) $(EXEC)

.PHONY: all clean debug


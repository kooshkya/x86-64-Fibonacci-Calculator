ASM = nasm
CC = gcc
ASM_FLAGS = -f elf64
CC_FLAGS = -nostartfiles -no-pie

SRC = fib.asm
OBJ = fib.o
EXEC = fib

all: $(EXEC)

$(OBJ): $(SRC)
	$(ASM) $(ASM_FLAGS) -o $@ $(SRC)

$(EXEC): $(OBJ)
	$(CC) $(CC_FLAGS) -o $@ $(OBJ)

clean:
	rm -f $(OBJ) $(EXEC)

.PHONY: all clean


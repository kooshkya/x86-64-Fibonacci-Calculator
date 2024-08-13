section .data
	query db "select n: ", 0;
	input_n db 3 dup(0);

section .text
	global _start;

_start:
	; input n
	mov rax, 1;
	mov rdi, 1;
	mov rsi, query;
	mov rdx, 10;
	syscall;

	; read user input
	mov rax, 0;
	mov rdi, 0;
	mov rsi, input_n;
	mov rdx, 3;
	syscall;

	; echo back the input
	mov rax, 1;
	mov rdi, 1;
	mov rsi, input_n;
	mov rdx, 3;
	syscall;

	mov rax, 60;
    	xor rdi, rdi;
    	syscall;

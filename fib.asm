section .data
	query db "select n: ", 0;
	input_n db 4 dup(0);

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
	mov rsi, input_n + 3;
	mov rdx, 1;
	syscall;
	
	push dword 0;
	push word 0;
	push byte 0;
	mov rbx, 0;
	mov bl, byte [input_n + 3];
	mov bl, 6;
	push rbx;
	call get_fib;
	pop qword [input_n];
	mov [query], rax;

	; echo back the input
	mov rax, 1;
	mov rdi, 1;
	mov rsi, query;
	mov rdx, 10;
	syscall;

	mov rax, 60;
    	xor rdi, rdi;
    	syscall;


get_fib:
	; push rbp and allocate a variable
	push rbp;
	mov rbp, rsp;
	sub rsp, 8;

	; move argument to rbx and check for base cases
	mov rbx, [rbp + 16];
	cmp rbx, 0;
	je zero_input;
	cmp rbx, 1;
	je one_input;
	
	; recursion: calculate fib(n - 1) and put it in the variable
	sub rbx, 1;
	push rbx;
	call get_fib;			
	pop rbx;
	mov [rbp - 8], rax;
	
	; recursion: calculate fib(n - 2) and add the variable to it in rax
	sub rbx, 1;
	push rbx;
	call get_fib;
	pop rbx;
	add rax, [rbp - 8];
	
	; free the variable and restore rbp and return
	add rsp, 8;
	pop rbp;
	ret;
	
	
zero_input:
	mov rax, 0;
	add rsp, 8;
	pop rbp;
	ret;

one_input:
	mov rax, 1;
	add rsp, 8;
	pop rbp;
	ret;
	
	

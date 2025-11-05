_STACK_SIZE EQU 1024
section .data
_stack_heap_head dq 0
_stack_heap_itr dw 0

_STACK_HEAP_REQUEST_SIZE equ 4

section .text
global _mall_ok
_mall_ok:
	push rbp
	mov rbp ,rsp

;reserve stack mem for allocs on stack
	sub rsp , _STACK_SIZE
	mov [rel _stack_heap_head] , rsp


  ;void* _mall_ok(uint16_t size);
  ; size -> rdi 
	; return -> rax

	 ;init rax - if 0 memory was not assigned
   mov rax , 0  

    
	 cmp rdi , _STACK_HEAP_REQUEST_SIZE
	 jle _try_stack


	mov rax , 0 
	mov rax ,rdi

  _try_stack:
	  call _alloc_stack
  add rsp, _STACK_SIZE 
	pop rbp
ret 


_alloc_stack:
	; rdi -> size
	; edx -> temp for calculations 
  push rbp
	mov rbp,rsp
	push rdx
  

	;wtf is taht rel addres 
	;check if stack have enough space
	mov rdx, [rel _stack_heap_itr]
  add rdx, rdi
  
	cmp edx , _STACK_SIZE 
  ja exit
  
	;allocating 
	mov rdx ,[rel _stack_heap_head]
  add rdx , [rel _stack_heap_itr]
	mov rax ,rdx
  
	add [rel _stack_heap_itr], rdi
  

  exit: 

	pop rdx
	pop rbp
  ret

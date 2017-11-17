;Arquivo start.asm

	bits 32
	section .text
	global start
	start:
	mov ax,0x10  ; Aponta segmento de dados no GDT    
	mov ds,ax
	mov ss,ax
	mov esp, _pilha
	xor eax,eax
	mov es,ax
	mov fs,ax
	mov gs,ax

    	jmp MAIN

	; Estas informações são exteriores ao script kernel.ld
    		EXTERN code, bss, end
    		dd code
    		dd bss
    		dd end
    		dd start

	MAIN:
    	
        	extern main
    		call main  ; Executa código em C

    	HLT ; Coloca o CPU para dormir
	section .bss
	global _pilha
     resb 8192 ; 8 KiB
	_pilha:

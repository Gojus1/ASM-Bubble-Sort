.model small
.stack 100h

MAX = 200

.data
	print1 db "Welcome to bubble sort", 0Dh, 0Ah
	print2 db "Enter an array of chars to sort:", 0Dh, 0Ah, '$'
	buffer db MAX
	buffer_size db ?
	buffer1 db MAX dup(?)
	new_line db	0Dh, 0Ah, '$'

.code
start:
	MOV ax, @data
	MOV ds, ax

	mov dx, offset print1
	mov ah, 09h
	int 21h

	mov ah, 0Ah
	lea dx, buffer
	int 21h

	call print_answer

	mov cl, buffer_size
	add cl, 1

	bubbleSort :
		dec cl

		cmp cl, 1
		jbe done

		lea si, buffer1
		mov ch, cl

	first_loop:
		mov al, [si]
		mov bl, [si+1]

		cmp bl, al
		jae no_swap
		
		mov [si], bl
		mov [si+1], al

	no_swap:
		inc si
		dec ch
		cmp ch, 1
		jbe bubbleSort

		jmp first_loop

	done:
		mov cl, buffer_size
		mov ch, 0
		mov bl, 1

		mov dx, offset buffer + 2
		mov ah, 40h
		int 21h

	MOV ah, 4Ch
	MOV al, 0
	INT 21h

	print_answer:
		push dx ax

		mov dx, offset new_line
		mov ah, 09h
		int 21h
		pop ax dx
		ret

end start

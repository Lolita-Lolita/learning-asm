assume cs:code,ds:data
data segment
	db "Beginner's All-purpose Symbolic Instruction Code.",0
data ends
code segment
	start:
	mov ax,data
	mov ds,ax
	mov si,0
	
	call letterc
	mov ax,4c00h
	int 21h
	
letterc:
    mov al,[si]
    cmp al,0
    je exit
    cmp al,61h     ;61hΪ��ĸa��ASCII��
    jb next
    cmp al,7ah     ;7ahΪ��ĸz��ASCII��
    ja next
    and al,11011111b
    mov [si],al
next:
    inc si
    jmp short letterc
exit:
    ret
code ends
    end start
end


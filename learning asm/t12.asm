assume cs:code
code segment
	dw 1,2,3,4,5,6,7,8	
	dw 0,0,0,0,0,0,0,0
	start:
	mov ax,cs
	mov ds,ax     ;���Ĵ���ds���a����
	mov ax,cs
	mov ss,ax     ;���Ĵ���ss���b����
	mov sp,32h
	
	mov bx,0
	mov cx,8
	s:
	push [bx]
	add bx,2
	loop s
	
	mov ax,4c00h
	int 21h
code ends
    end start
end

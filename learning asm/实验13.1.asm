assume cs:code
data segment
	db "Welcome to masm!",0
data ends
code segment
	start:
	mov ax,cs
	mov ds,ax
	mov si,offset no7c
	mov ax,0
	mov es,ax
	mov di,200h
	mov cx,offset no7cend-offset no7c
	cld
	rep movsb                             ;7ch�жϴ��������밲װ��0:200h
	
	mov es:[7ch*4],200h
	mov es:[7ch*4+2],0                    ;����7ch�жϵ��ж������������д����жϴ�������CS,IP
	
	mov dh,10
	mov dl,10
	mov cl,2
	mov ax,data
	mov ds,ax
	mov si,0
	int 7ch
	
	mov ax,4c00h
	int 21h                        
	
no7c:
    push ax       ;�����ж�����[��ʼ]
    push bx
    push di
    mov bx,0b800h
    mov es,bx
    mov al,160d
    mul dh
    mov di,ax
    mov al,2        ;��6��Ϊȷ������������Դ��ƫ�Ƶ�ַ��
    mul dl          ;������"mov di,160*dh+2*dl"��ͼ�ﵽ��6��ָ��Ĺ��ܡ�
    add di,ax
    
    mov bl,cl
again: 
     mov cx,[si]
     jcxz no7cret
     mov es:[di],cl
     mov es:[di+1],bl
     inc si
     add di,2
     jmp short again
no7cret:        
     pop di
     pop bx
     pop ax
     iret
no7cend:       
     nop       
code ends
     end start

data segment
	db 'Welcome to masm!',0
data ends
assume cs:code,ds:data
code segment
	start:
	mov ax,data
	mov ds,ax        ;ds�д��data��
	mov dh,8         ;�ڰ���
	mov dl,3         ;������
	mov cl,0cah      ;��ɫ����Ϊ0cah
	
	call show_ptr
	mov ax,4c00h
	int 21h
	
show_ptr:
    mov al,0a0h
    dec dh
    mul dh
    mov bx,ax        ;�ڰ��е�ƫ�Ƶ�ַ
    mov al,2
    mul dl
    sub ax,2
    add bx,ax        ;�ڰ��е����е�ƫ�Ƶ�ַ�����bx��
    
    mov ax,0b800h
    mov es,ax        ;es�����Դ�Ķε�ַ
    
    mov si,0
    mov di,0
    mov al,cl        ;��ɫ����ת�Ƹ�al
s:  
    mov cl,ds:[si]
    mov ch,0
    jcxz ok
    mov es:[bx+di],cl
    mov es:[bx+di+1],al 
    inc si
    add di,2
    jmp short s
    
ok: 
    ret
    
code ends
    end start
end

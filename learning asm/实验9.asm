assume cs:code,ds:data,ss:stack
data segment
	db 'welcome to masm!'  ;����Ҫ��ʾ���ַ���(��16�ֽ�)
	db 02h,24h,71h    ;����������ɫ����
data ends
stack segment
	dw 8 dup(0)
stack ends
code segment
	start:
	mov ax,data
	mov ds,ax
	mov ax,stack
	mov ss,ax
	mov sp,10h
	mov dx,0b872h  ;���õ�ʮ�����м���ʼλ��
	mov si,0       ;data������ѭ��
	mov di,0       ;�Դ��ڴ���ѭ��
	mov bx,10h     ;data�����ַ�������ѡ��

    mov cx,3
s:  
    push cx
    push si
    push di
    mov es,dx
    
    mov cx,10h
s1:
    mov al,ds:[si]
    mov es:[di],al
    inc si
    add di,2
    loop s1
    
    mov al,ds:[bx]
    mov di,1
s2:
    mov es:[di],al
    add di,2
    loop s2
    
    inc bx
    add dx,0ah
    pop di
    pop si
    pop cx
    loop s
    



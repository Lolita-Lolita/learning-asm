;���ַ���'1. display      '             
;        '2. brows        '
;        '3. replace      '
;        '4. modify       '
;�е�ǰ4����ĸ��дΪ��д��ĸ
assume cs:code,ds:data,ss:stack
data segment
	db '1. display      '             
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
data ends
stack segment
	dw 0,0,0,0  
stack ends               ;����һ��ջ�������ݴ���ѭ��ֵcx
code segment
	start:
	mov ax,data
	mov ds,ax
	mov bx,0
	
	mov cx,4              ;���ѭ��������cx�Ĵ�
s1: push cx               ;���ѭ��������ջ
    
    mov cx,4              ;�ڲ�ѭ��������cx�Ĵ�
    mov si,3
s2: mov al,[bx][si]
    and al,11011111b
    mov [bx][si],al
    inc si
    loop s2
    
    add bx,16
    pop cx            ;�����ѭ��������ջ������ԭ����cx
    loop s1
    
    mov ax,4c00h           
    int 21h
code ends
    end start
end


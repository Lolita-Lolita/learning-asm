;���ַ���'ibm             '
;        'dec             '
;        'dos             '
;        'vax             '
;�е�ǰ3����ĸ��дΪ��д��ĸ
assume cs:codesg,ds:datasg
datasg segment
	db 'ibm             '
	db 'dec             '
	db 'dos             '
	db 'vax             '
datasg ends
codesg segment
	start:
	mov ax,datasg
	mov ds,ax
	mov bx,0
	
	mov cx,4              ;���ѭ��������cx�Ĵ�
s1: mov dx,cx             ;�Ĵ���dx�ݴ����ѭ������
    
    mov cx,3              ;�ڲ�ѭ��������cx�Ĵ�
    mov si,0
s2: mov al,[bx][si]
    and al,11011111b
    mov [bx][si],al
    inc si
    loop s2
    
    add bx,16
    mov cx,dx             ;�����ѭ��������ֵ����cx
    loop s1
    
    mov ax,4c00h           
    int 21h
codesg ends
    end start
end


;���ڴ�0:200-0:23F(20:0-20:3F)�����δ�������0-63
assume cs:write
write segment
	mov ax,20h
	mov ds,ax      ;���ڴ�20:0�Ķε�ַ����ds
	mov dl,0       ;��ʼ��Ҫ���͵�����
	mov bx,0       ;��ʼ��ѭ������
	
	mov cx,64      ;ѭ������64��
s:
    mov [bx],dl	   ;д������
    inc bx
    inc dl
    loop s
    
    mov ax,4c00h
    int 21h
write ends
end

assume cs:code
code segment;��������
	mov ax,0ffffh
	mov ds,ax
	mov bx,6
	mov al,[bx];ax��λ��ֵ
	mov ah,0;ax��λ����
	mov dx,0;�ۼӼĴ���dx����
	mov cx,100;����ѭ������
s:  add dx,ax;ѭ����
    loop s
    
    mov ax,4c00h
    int 21c;���򷵻�
code ends;��������
end


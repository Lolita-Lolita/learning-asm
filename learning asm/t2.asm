;����ffff:0-ffff:b�ڴ浥Ԫ�еĺͣ����������dx��
assume cs:sum       ;cs:ipָ��sum�����
sum segment         ;��������sum
	mov ax,0ffffh     
	mov ds,ax
	mov bx,0        ;��ʼ��ds:[]
	
	mov dx,0        ;��ʼ���ۼӼĴ���dx
	
	mov cx,12       ;����ѭ������
s:	mov al,[bx]
	mov ah,0        ;���ڴ浥Ԫ[bx]����ָ����ax
	add dx,ax       ;���ü���ѭ����
	inc bx          ;ָ����һ���ڴ浥Ԫ
	loop s
	
	mov ax,4c00h
	int 21h         ;���򷵻�
sum ends            ;��������sum
end                 ;�������

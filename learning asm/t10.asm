;��a����b���е�����������ӣ��������c����
a segment
	db 1,2,3,4,5,6,7,8        ;����һ����a,�����൱�����ݶ�,��ds��Ϊ���ĶμĴ���
a ends
b segment
	db 1,2,3,4,5,6,7,8        ;����һ����b,�����൱�����ݶ�,��es��Ϊ���ĶμĴ���
b ends
c segment
	db 0,0,0,0,0,0,0,0        ;����һ����c,�����൱�����ݶ�,��ss��Ϊ���ĶμĴ�����
c ends
assume cs:code ;cs�μĴ�������code��
code segment
	mov ax,a
	mov ds,ax   ;�����a�ĶμĴ�����ʼ��ַ
	
	mov ax,b
	mov es,ax   ;�����b�ĶμĴ�����ʼ��ַ
	
	mov ax,c
	mov ss,ax   ;�����c�ĶμĴ�����ʼ��ַ
	
	mov al,0    ;������Ӻ����������ļĴ���
	mov bx,0    ;��ʼ�������ݶε��ڴ�ƫ�Ƶ�ַ
	mov cx,8    ;ѭ������
s:
    mov al,[bx] ;��a:[bx]�е���������al��
    add es:[bx],al;��a:[bx]+b:[bx]�Ľ������b:[bx]��
    mov al,es:[bx];��b:[bx]�еĽ������al��
    mov ss:[bx],al;��al�еĽ������c:[bx]��
    inc bx        ;bx=bx+1
    loop s
    
    mov ax,4c00h
    int 21h
code ends
end



assume cs:code
code segment
	start:
	mov ax,2000h
	mov ds,ax         ;���ڴ�2000h���Ķε�ַ��λ��ds��
	
	mov bx,0          ;��ʼ��ds:[bx]Ϊds:[0]
s:  mov cl,[bx]
    mov ch,0          ;���ڴ�ds:[bx]�е��ֽ�����cx�Ĵ�����
    inc cx            ;(cx)=(cx)+1
    inc bx            ;������һ��ѭ��
    loop s            ;(cx)=(cx)-1,��cx�мĴ���ڴ�ds:[bx]�е��ֽڷ��ظ�cx�����(cx)!=0,��ת��s,���cx=0,����ִ��
    
ok: dec bx            ;(bx)=(bx)-1,��bx�е�ֵ��ȥһ����ΪS�������inc bx,�Ķ���bx��ֵ
    mov dx,bx         
    
    mov ax,4c00h
    int 21h
code ends
    end start
end

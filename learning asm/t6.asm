;��8������0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h�ĺ�����ax��
assume cs:code
code segment
	dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h;����8���֣�����CS:0��
	mov ax,0                                          ;��ʼ���ۼӼĴ���
	mov bx,0                                          ;��ʼ��ƫ�Ƶ�ַ
	
    mov cx,8                                          
s:  add ax,cs:[bx]                                    ;��cs:[bx]�е���������ax��
    add bx,2                                         
    loop s
    
    mov ax,4c00h
    int 21h
code ends
end

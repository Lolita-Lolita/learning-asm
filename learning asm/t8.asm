;��8��0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h����������ջ��Ȼ���ջ��ԭ�����ڴ��ַ,����������������
assume cs:code
code segment
	dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h   ;����8���ַ���cs:0-15
	dw 0,0,0,0,0,0,0,0                                   ;����8���ֵĿռ���ջ,ջ��ַΪcs:16-31
	start:                                               ;����ָ����ڵ�
	    mov ax,cs
	    mov ss,ax
	    mov sp,32                                        ;����ջ��ss:sp=cs:32
	    mov bx,0                                         ;��ʼ���ڴ�ƫ�Ƶ�ַ
	    
	    mov cx,8                                         
s1:
        push cs:[bx]                                     ;��ջ
        add bx,2
        loop s1
        
        mov bx,0                                         ;���³�ʼ���ڴ�ƫ�Ƶ�ַ                                   
        
        mov cx,8
s2:     
        pop cs:[bx]                                      ;��ջ
        add bx,2
        loop s2
        
        mov ax,4c00h
        int 21h                                          ;���򷵻�
code ends
    end start
end
	    

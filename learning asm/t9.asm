;��8��0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h����������ջ��Ȼ���ջ��ԭ�����ڴ��ַ,����������������
data segment
	dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h   ;���ݶ�
data ends	
stack segment
	dw 0,0,0,0,0,0,0,0                                   ;����8��ջ
stack ends
assume cs:code,ds:data,ss:stack                          ;˵��cs�μĴ�������code,ds�μĴ�������data,ss�Ĵ�������stack
code segment                                 
	start:                                               ;����ָ����ڵ�
	    mov ax,stack
	    mov ss,ax
	    mov sp,16                                        ;����ջ��ss:sp=stack:16
	    mov ax,data
	    mov ds,ax                                        ;�������ݶ�ds�ĳ�ʼֵ
	    mov bx,0                                         ;��ʼ���ڴ�ƫ�Ƶ�ַ
	    
	    mov cx,8                                         
s1:
        push [bx]                                        ;��ջ
        add bx,2
        loop s1
        
        mov bx,0                                         ;���³�ʼ���ڴ�ƫ�Ƶ�ַ                                   
        
        mov cx,8
s2:     
        pop [bx]                                         ;��ջ
        add bx,2
        loop s2
        
        mov ax,4c00h
        int 21h                                          ;���򷵻�
code ends
    end start
end
	    

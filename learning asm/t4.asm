;���ڴ�ffff:0-ffff:b�е����ݿ�����0:200-0:20b(0020:0-0020:b)
assume cs:copy
copy segment              ;����γ�ʼ
	mov bx,0              ;ѭ��������ʼ��0
	mov ax,0ffffh
	mov ds,ax             ;�ڴ�ffff:0�ε�ַ����ds
	mov ax,20h
	mov es,ax             ;�ڴ�0020:0�ε�ַ����es
	
	mov cx,12        
s:  mov dl,[bx]
    mov es:[bx],dl        ;ʵ�����ݿ���
    inc bx  
    loop s
    
    mov ax,4c00h
    int 21h
copy ends
end              
             
	 

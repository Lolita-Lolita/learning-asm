;���ñ�̣�ʵ�����ڴ�2000h����Ѱ�ҵ�һ��ֵΪ0���ֽڣ��ҵ��󣬽�����ƫ�Ƶ�ַ�洢��dx��
assume cs:code
code segment
	start:
	mov ax,2000h
	mov ds,ax       ;��ds��λ���ڴ�2000h�δ�
	
	mov bx,0        ;��ʼ��ds:[bx]Ϊds:[0]
s:  mov cl,[bx] 
    mov ch,0        ;��ds:[bx]�е��ֽڴ���cx��
    jcxz ok         ;���(cx)=0,��(ds:[bx])=0,��ת��ok��Ŵ�
    inc bx          ;���(cx)!=0,ƫ�Ƶ�ַdx+1
    jmp short s     ;���(cx)!=0,��ת�����s����������һ��ѭ��ֱ��jcxz okִ��Ϊֹ
    
ok: mov dx,bx       ;(cx)=(ds:[bx])=0ʱ���bx�Ĵ��ƫ�Ƶ�ַ����dx

    mov ax,4c00h
    int 21h
code ends
    end start
end
	

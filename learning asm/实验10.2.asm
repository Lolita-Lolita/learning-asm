;���1000000/10�����������dxΪ�̵ĸ�16λ��axΪ�̵ĵ�16λ��cxΪ����
assume cs:code,ss:stack
stack segment
	dw 8 dup(0)
stack ends
code segment
	start:
	mov ax,stack
	mov ss,ax
	mov sp,10h      ;����ջ��
	mov ax,4240h    ;�������ĵ�16λ
	mov dx,000fh    ;�������ĸ�16λ
	mov cx,000ah    ;����10����Ϊ16λ
	
	call divdw
	mov ax,4c00h
	int 21h
	
divdw:
    push ax         ;���������ĵ�16λѹջ
    mov ax,dx
    mov dx,0        ;dx:ax��ʱΪ�������ĸ�16λ����Ϊһ��32λ������
    div cx          ;ax�洢��16λ���̣�dxλ��16λ������
    mov bx,ax       ;bx�ݴ��16λ����
    pop ax          ;��������16λ��ջ,dx:ax��ʾrem(H/N)+L
    div cx          ;axλ�̵ĵ�16λ,dxΪ����
    mov cx,dx       ;cxΪ�ܽ��������
    mov dx,bx       ;dxΪ�ܽ�����̵ĸ�16λ,axΪ�ܽ���̵ĵ�16λ
    ;32λ������/16λ����=�������ĸ�16λ(����32λ)/16λ����  Ϊ�̵ĸ�16λ
    ;+[�������ĸ�16λ/16Ϊ��������(dx):��������16λ(ax)]/16λ����  �������Ϊ�����������������Ϊ�����̵ĵ�16λ
ret
code ends
    end start
end
    

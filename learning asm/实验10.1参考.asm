data segment

        db 'Welcome to masm!',0

data ends

 

code segment

        assume cs:code,ds:data

start:

        mov dh,8              ;dhװ�к�(��Χ:1--25)

        mov dl,3             ;dlװ�к�(��Χ:1--80)[ע:ÿ����80�����к��Զ���1]

        mov cl,0cah           ;cl�д����ɫ����(0cahΪ��׸�����˸��ɫ����)

        mov ax,data

        mov ds,ax

        mov si,0

 

        call show_str

        

        mov ax,4c00h

        int 21h

        

show_str:   ;��ʾ�ַ������ӳ���[���忪ʼ]

        push cx

        push si

        mov al,0A0h

        dec dh          ;�к����Դ����±��0��ʼ,���Լ�1

        mul dh

        mov bx,ax

        mov al,2

        mul dl

        sub ax,2       ;�к����Դ����±��0��ʼ,����Ϊż�ֽڴ���ַ�,���Լ�2

        add bx,ax      ;��ʱbx�д�ŵ��������кŵ�ƫ�Ƶ�ַ

        mov ax,0B800h

        mov es,ax      ;es�д�ŵ����Դ�ĵ�0ҳ(��0--7ҳ)����ʼ�Ķε�ַ

        mov di,0

        mov al,cl

        mov ch,0

s:      mov cl,ds:[si]

        jcxz ok

        mov es:[bx+di],cl       ;ż��ַ����ַ�

        mov es:[bx+di+1],al     ;���ַ����ַ�����ɫ����

        inc si

        add di,2

        jmp short s

ok:     pop si

        pop cx

        ret    ;��ʾ�ַ������ӳ���[�������]

 

code ends

end start

 


assume cs:code

code segment

start:

        mov ax,cs

        mov ds,ax

        mov si,offset lp

        mov ax,0

        mov es,ax

        mov di,200h

        mov cx,offset lpend-offset lp

        cld

        rep movsb

        ;����9��Ϊ��װ�ж�����



        mov word ptr es:[7ch*4],200h

        mov word ptr es:[7ch*4+2],0

        ;����2��Ϊ�����ж�����



        mov ax,0b800h

        mov es,ax

        mov di,160*12                ;ȡ���Դ��12�е�0�е�ƫ�Ƶ�ַ

        mov bx,offset s-offset se

        mov cx,80

s:      mov byte ptr es:[di],'!'

        add di,2

        int 7ch

se:     nop

        mov ax,4c00h

        int 21h

 

lp:     ;�ж����̶���[��ʼ]

        push bp

        mov bp,sp

        dec cx

        jcxz lpret

        add [bp+2],bx

lpret:        pop bp

              iret       ;�жϵķ���ָ��

lpend:        nop        ;�ж����̶���[����]

 

code ends

end start



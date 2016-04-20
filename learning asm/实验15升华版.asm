assume cs:code,ss:stack
stack segment
	db 128 dup(0)
stack ends
code segment
main:
    mov ax,stack
    mov ss,ax
    mov sp,128                   ;ssָ��stack��
    
    mov ax,0
    mov es,ax                    ;esָ��0:[]��
    push es:[9*4]
    pop es:[200h]
    push es:[9*4+2]
    pop es:[202h]                ;��ԭBIOS�ṩ��int9�ж����̵���ڵ����0:[200h]��
;***************************��int9�ж����̰�װ���ж��������ָ��**********************************   
    push cs
    pop ds                       ;dsָ��code��
    mov si,offset int9
    mov di,204h
    mov cx,offset int9end-offset int9
    cld
    rep movsb
    
    mov word ptr es:[9*4],204h
    mov word ptr es:[9*4+2],0    ;9���ж����������д������int9�ж����̵ĳ�����ڵ�
;*************************************************************************************************
    mov ax,0b800h
    mov es,ax                    ;esָ���Դ洦
    mov ah,'a'
s:                               ;��Ļ�м���ʾ��'a'-'z'
    mov es:[160*12+40*2],ah
    call delay
    inc ah
    cmp ah,'z'
    jna s  
    
    mov cx,120
lp: 
    mov ah,0    ;����120�ζ�ȡBIOS���̻������Ĳ�����
    int 16h     ;�Ը��������ڳ�������ʱ���������صİ���������
    loop lp    
    
    mov ax,0
    mov es,ax
    push es:[200h]
    pop es:[9*4]
    push es:[202h]
    pop es:[9*4+2]               ;BIOS�ṩ��ԭint9�ж����̵ĳ�����ڵ�ָ���9���ж�����������

    mov ax,4c00h
    int 21h   
delay:                           ;����ѭ����ʱ
    push ax
    mov dx,1000h
    mov ax,0
s0: 
    sub ax,1
    sbb dx,0
    cmp dx,0
    jne s0
    pop ax
    ret
    
;�µ�int9�ж�����
int9: 
    push ax
    push bx
    push es
    
    in al,60h                    ;�Ӷ˿�60h��ȡɨ������al��
    pushf                        ;Flag��ջ
    pushf
    pop bx
    and bh,11111100b
    push bx
    popf                         ;����IF=0,TF=0
    mov ax,0
    mov es,ax
    call dword ptr es:[200h]     ;push CS,push IP,(IP)=(200H),(CS)=(0),����ԭint9�ж�����
    
x1: 
    cmp al,1                     ;��ESCͨ��Ƚ�
    jne int9ret
    push ax
    mov ax,0b800h
    mov es,ax
    mov bx,1
    mov cx,2000
s1: 
    inc byte ptr es:[bx]
    add bx,2
    loop s1
    pop ax
    jmp x2
    
x2:   
    cmp al,9eh                    ;��'A'������бȽ�
    jne int9ret
    mov ax,0b800h
    mov es,ax
    mov bx,0
    mov cx,2000
s2: 
    mov byte ptr es:[bx],'A'
    add bx,2
    loop s2
    
int9ret:
    pop es
    pop bx
    pop ax
    iret
int9end:
    nop

code ends
    end main
               
                            
    
    



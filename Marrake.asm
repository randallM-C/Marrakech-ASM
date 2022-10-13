;--------------------------------------------------------------
;----------------PORTADA-------------
; Tecnologico de Costa Rica - Arquitectura de Computadoras - G2
; Realizado por: Randall Madriz Coto
; Carne: 2021439687
; TAREA: Centurión
; Entrega: 28/9/2022
;-------------------------------------
;-------------MANUAL DE USUARIO--------------
;--------------------------------------------
;-------------ANALISIS DE RESULTADOS---------
;--------------------------------------------
data segment
    


   help db '$'


 data ends

 blanco EQU 11110000b

                  
stackS segment stack 'stack'

    dw 256 dup (?)

 stackS ends


code segment

    assume  cs:code, ds:data, ss:stackS

PushReg Macro
    push ax 
    push bx 
    push cx 
    push dx 
    push di 
    push si 
    push es

endM
PopReg Macro
    pop es
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax

endM



drawBackG Proc
    PushReg 

    mov ax, 0B800h      ; pone el ES a apuntar al segmento de video
    mov es, ax

    xor si, si
    mov cx, 80*25
    mov ah, blanco
    franja1:
        mov word ptr es:[si], ax
        inc si
        inc si          
        loop franja1


    PopReg
    ret 
drawBackG EndP




main: mov ax, ds
    mov es, ax

    mov ax, data
    mov ds, ax

    mov ax, stackS
    mov ss, ax

    ;------------------
    
    call drawBackG

    mov ax, 0B800h      ; pone el ES a apuntar al segmento de video
    mov es, ax



    cic:
    jmp cic

    exitProgram:
        mov ax, 4C00h
        int 21h









code ends

end main
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

                  
stackS segment stack 'stack'

    dw 256 dup (?)

 stackS ends


code segment

    assume  cs:code, ds:data, ss:stackS

main: mov ax, ds
      mov es, ax

      mov ax, data
      mov ds, ax

      mov ax, stackS
      mov ss, ax
      
      ;------------------

       

      exitProgram:
         mov ax, 4C00h
         int 21h 






code ends

end main
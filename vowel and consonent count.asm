

#Vowels Consonat 
include 'emu8086.inc'
org 100h

jmp start

buffer  db 100 dup('$')  

       

start:    
       
       mov di, offset buffer
       mov dx,99
       call get_string
       
       mov bx,0
       mov cx,-1
       mov si,offset buffer
        
        
     outer_loop:
        mov al,[si]
        inc si
        cmp al,'$'
        je done
        cmp al,'a'
        je cnt
        cmp al,'e'
        je cnt
        cmp al,'i'
        je cnt
        cmp al,'o'
        je cnt
        cmp al,'u'
        je cnt
        
        inc cx
        jmp outer_loop
       cnt:
          inc bx
          jmp outer_loop
        
       
        
       done: 
        printn
        print "Vowels : "
        mov ax,bx
        call print_num
        printn
        print "Consonatn : "
        mov ax,cx
        call print_num
        
        
        
        
        
        
        
     
        
        
       mov ah,4ch
       int 21h
        
 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_STRING
DEFINE_GET_STRING
DEFINE_PTHIS

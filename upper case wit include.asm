
#print_upper_case:

include 'emu8086.inc'
org 100h

jmp start

buffer  db 100 dup('$')  

       

start:    

         
       mov di, offset buffer   
       mov dx,99
       call get_string
       
       printn      
       mov si,offset buffer
      
   
    outer_loop:
        mov al,[si]
        cmp al,'$'
        je done
        cmp al,'a'
        jb skip
        cmp al,'z'
        ja skip
        
        sub al,32
        mov [si],al  
        
      skip:
        inc si
        jmp outer_loop
      
      done:
      printn
      print "UpperCase : "
      mov si,offset buffer
      call print_string
       
        
        
        
        
       mov ah,4ch
       int 21h
        
 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_STRING
DEFINE_GET_STRING
DEFINE_PTHIS




 
#input string

include 'emu8086.inc'
org 100h

jmp start

buffer  db 100 dup('$')  

       

start:   
print "Enter the string : " 

         
       mov di, offset buffer   
       mov dx,99
       call get_string
       
       printn      
       mov si,offset buffer
       call print_string
        
       mov ah,4ch
       int 21h
        
 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_STRING
DEFINE_GET_STRING
DEFINE_PTHIS


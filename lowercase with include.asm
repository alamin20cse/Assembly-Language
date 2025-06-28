
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc'
org 100h

; add your code here

.data
bff db 100 dup('$')  


.code


print "Enter the string :" 

mov di,offset bff
mov dx,99
call get_string

printn

mov si,offset bff
call print_string

 printn




convetupper:
mov al,[si] 
cmp al,'$' 
je done
cmp al,'A'
jb skip
cmp al,'Z'
ja skip
add al,32
mov [si],al



skip:
inc si
jmp convetupper


done: 
print "lower case :" 
printn
mov si,offset bff
call print_string

exit:
mov ah,4ch
int 21h 
define_scan_num
define_print_num
define_print_num_uns
define_get_string
define_print_string

end




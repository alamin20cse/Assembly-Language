
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc'
org 100h

; add your code here
.data
count dw ?
arr dw 100 {?)

.code
print "Enter the how many number : "
call scan_num
printn

mov count,cx

mov si,0 
mov bx,cx

print "Enter number : "

    input:
    call scan_num
    printn
    mov arr[si],cx
    add si,2
    dec bx
    cmp bx,0
    jne input


print "out put  :" 
printn

mov si,0
mov bx,count
    output:
    mov ax,arr[si]
    call print_num_uns 
    printn
    add si,2
    dec bx
    
    cmp bx,0
    jne output





mov si,0
mov bx,count
mov ax,arr[si] 
mov dx,ax 
add si,2
dec bx


        find_max:
        mov ax,arr[si]
        cmp ax,dx
        jge next
        mov dx,ax




    next:
    add si,2
    dec bx
    
    cmp bx,0
    jne find_max

printn

print "Min number : "
mov ax,dx
call print_num_uns

ret
define_scan_num
define_print_num
define_print_num_uns
define_get_string
define_print_string





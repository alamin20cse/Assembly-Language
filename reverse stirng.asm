
#print_reversed:
include 'emu8086.inc'
org 100h

jmp start

buffer db 100 dup('$') 

start:
    mov di, offset buffer
    mov dx, 99
    call get_string

    mov si, offset buffer
    mov cx, 0

find_length:
    mov al, [si]
    cmp al, '$'
    je found_length
    inc si
    inc cx
    jmp find_length

found_length:
    printn
    print "Reversed: "

    ; Print in reverse
    mov si, offset buffer
    add si, cx
    dec si           ; Move to last valid character

print_loop:
    mov al, [si]
    PUTC al            ; Print character in AL
    dec si
    loop print_loop

    ; Exit
    mov ah, 4ch
    int 21h

DEFINE_PRINT_STRING
DEFINE_GET_STRING
end

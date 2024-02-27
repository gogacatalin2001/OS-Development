org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start:
    jmp main

;
; Prints a string to the screen
; Params:
;   - ds:si points to the string

puts:
    ; save registers that will be modified
    push si
    push ax
.loop:
    lodsb           ; loads next character in AL
    or al, al       ; verify if next character id null
    jz .done        ; if yes, then stop
    ; use INT 0Eh for printing a character to the screen
    mov ah, 0Eh     ; call BIOS interrupt
    mov bh, 0       ; page number (text modes)
    int 10h
    jmp .loop       ; loop while there still
                    ; are characters to print
.done:
    pop ax
    pop si
    ret

main:

    ; setup data segments
    mov ax, 0       ; can't write to DS/EX directly
    mov ds, ax
    mov es, ax

    ; setup stack
    mov si, ax
    mov sp, 0x7C00

    ; print message
    mov si, msg_hello
    call puts

    hlt

.halt:
    jmp .halt

msg_hello: db 'Hello, world!', ENDL, 0


times 510-($-$$) db 0
dw 0AA55h

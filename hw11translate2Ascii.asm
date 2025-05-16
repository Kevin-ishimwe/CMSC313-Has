; Kevin IShimwe mon-wed 8:30am section
; CMSC 313 HW#11  Print out data in ASCII hex
; Assemble: nasm -f elf32 hw11translate2Ascii.asm -o hw11translate2Ascii.o
; Link: ld -m elf_i386 hw11translate2Ascii.o -o hw11translate2Ascii
; Run: ./hw11translate2Ascii

SECTION .data
    inputBuf:   db 0x83, 0x6A, 0x88, 0xDE, 0x9A, 0xC3, 0x54, 0x9A  ; input bytes
    inputSize:  equ $ - inputBuf      ; number of input bytes
    ASCIItable: db "0123456789ABCDEF"      ; ASCII hex characters (0–9, A–F)

SECTION .bss
    outputBuf:  resb 80         ; Output buffer bytes in memory for the output string

SECTION .text
    global _start

_start:
    ; initialize registers for reading input and writing output
    mov esi, inputBuf                     ; input bytes
    mov edi, outputBuf                 ; output buffer
    mov ecx, inputSize                 ; number of bytes to convert

read_next_byte:
    mov al, [esi]                         ; load byte from input buffer i.e (0x83)
    call translateByte                    ; convert byte in AL to two ASCII hex characters
    mov byte [edi], ' '                   ; add space after each byte
    inc edi
    inc esi
    loop read_next_byte                ; Loop through and translate each hex value

    ; 2 newline characters to advance at the end of the output buffer
    mov byte [edi], 0Ah         
    inc edi
    mov byte [edi], 0Ah                  
    inc edi

    ; Write output to stdout
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, outputBuf                    ; address of string to write
    mov edx, edi                          ; calculate length of output string
    sub edx, outputBuf                    ; number of bytes to write using substract 
    int 80h                             

    ; Exit program
    mov     ebx, 0                        ; return 0 status on exit - 'No Errors'
    mov     eax, 1                        ; invoke SYS_EXIT (kernel opcode 1)
    int     80h                          ; exit syscall

; EXTRA-CREDIT: Subroutine to perform translation of a character byte to ASCII hex
translateByte:
    mov ah, al                            ; copy of original for splittinf 
    shr al, 4                             ; isolate high 4 bits to AL (0-F)
    and ah, 0x0F                          ; keep low 4 bits to AH (0-F)
    
    ; convert high bits to ASCII
    mov bl, al                            ; isolate high bits to BL
    mov bl, [ASCIItable + ebx]            ; find ASCII character
    mov [edi], bl                         ; store high hex character
    inc edi
    
    ; similary convert low bits 
    mov bl, ah                           
    mov bl, [ASCIItable + ebx]           
    mov [edi], bl                    
    inc edi
    ret  
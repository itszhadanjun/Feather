; -------------------------------------------------
;
; The bootloader for the FeatherOS
; Written in x86 Assembly
;
; -------------------------------------------------

    BITS 64

; -------------------------------------------------

; The header files goes here

; -------------------------------------------------

; Bootloader Definition
%define bootloader_name    "FeatherOS Bootloader"
%define bootloader_vers    1
%define system_call        int 80h

; For printing use information
bootloader_pt_name         db "FeatherOS Bootloader", 0ah
bootloader_pt_vers         db "Version 1.0 Alpha", 0ah
bootloader_pt_date         db "15th April 2024"
bootloader_pt_name_len     equ $ - bootloader_pt_name
bootloader_pt_vers_len     equ $ - bootloader_pt_vers
bootloader_pt_date_len     equ $ - bootloader_pt_date

; -------------------------------------------------
    jmp boot_init

boot_init:
    call boot_basic_info
    call boot_shutdown

boot_setup_terminal:
    nop

boot_basic_info:                  ; Print the basic information in Terminal
    mov rax, 4
    mov rbx, 1
    mov rcx, bootloader_pt_name
    mov rdx, bootloader_pt_name_len
    system_call
    mov rcx, bootloader_pt_vers
    mov rdx, bootloader_pt_vers_len
    system_call
    mov rcx, bootloader_pt_date
    mov rdx, bootloader_pt_date_len
    system_call
    ret

boot_shutdown:                    ; Exit the system
    mov rax, 1
    mov rbx, 0
    system_call
    ret
; -------------------------------------------------

    times 510-($-$$) db 0
    dw 0xAA55

; -------------------------------------------------

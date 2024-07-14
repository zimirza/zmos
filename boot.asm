BITS 16
ORG 0x7C00

JMP _start

new_line:
  MOV AH, 0x0002
  MOV BH, 0x0000
  INC DH
  INT 0x0010

title:
  MOV AH, 0x0013
  MOV AL, 0x0000
  MOV BH, 0x0000
  MOV BL, 0x0007
  MOV CX, program_title_length
  MOV DH, 0x0000
  MOV DL, 0x0000
  MOV BP, program_title
  INT 0x0010

  CALL new_line

_start:
  MOV AH, 0x0006
  MOV BH, 0x001F
  MOV DX, 0x184F
  INT 0x0010

  MOV AH, 0x0002
  MOV BH, 0x0000
  MOV DH, 0x0000
  MOV DL, 0x0000
  INT 0x0010

  MOV BX, program_title
  CALL title

  JMP $

program_title DB "Bootloader", 0
program_title_length equ $-program_title-1

TIMES 510-($-$$) DB 0
DW 0xAA55
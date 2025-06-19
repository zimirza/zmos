BITS 16
ORG 0x7C00

JMP _start

%include "print.S"

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

  MOV SI, PROGRAM_TITLE
  CALL print
  CALL print_new_line

  JMP $

PROGRAM_TITLE DB "ZMOS Bootloader", 0

TIMES 510-($-$$) DB 0
DW 0xAA55
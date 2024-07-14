ORG 0x7C00

JMP _start

_start:
  JMP $

TIMES 510-($-$$) DB 0
DW 0xAA55
print_new_line:
  MOV AH, 0x0002
  MOV BH, 0x0000
  INC DH
  INT 0x0010

print:
  MOV AH, 0x000E
  MOV AL, 0x0000
  MOV BL, 0x0007

print_loop:
  MOV AL, [SI]
  CMP AL, 0x0000
  JZ print_done
  INC SI
  INT 0x0010
  JMP print_loop

print_done:
  RET
all:
	@nasm -f bin boot.S -o boot.bin
	@qemu-system-x86_64 -drive format=raw,file=boot.bin
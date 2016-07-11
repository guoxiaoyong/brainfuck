useful := $(wildcard *.c *.asm) Makefile brainfuck src
rmfiles := $(filter-out $(useful),$(wildcard *))

CFLAGS:= -O0 -ggdb3 #-DDEBUG_MSG

all: gbf bf

bf: bf.asm
	nasm -f bin -o bf bf.asm && chmod +x bf

.PHONY: clean install

install:
	cp bf /usr/bin
	cp gbf /usr/bin

clean:
	$(RM) $(rmfiles)

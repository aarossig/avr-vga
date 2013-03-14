#
# Makefile for an AVR-based VGA Generator
#

# Source and Bin files. This project is simple and only has one source file.
SRC = main.s
BIN = main

# The target microcontroller
MMCU = atmega1284p

# Fuses used to automate the writefuses target
HFUSE = 0x99
LFUSE = 0xD6

CFLAGS = -x assembler-with-cpp -nostartfiles

all: $(PROG).hex

$(PROG).hex: $(SRC)
	avr-gcc $(CFLAGS) -mmcu=$(MMCU) -o $(BIN).elf $(SRC)
	avr-objcopy --output-target=ihex $(BIN).elf $(BIN).hex
	avr-objdump -DS $(BIN).elf >| $(BIN).out.s

program: all
	sudo avrdude -B 1 -p $(MMCU) -P usb -c avrisp2 -F -u -U flash:w:$(BIN).hex

writefuses:
	sudo avrdude -p $(MMCU) -P usb -c avrisp2 -F -u -U lfuse:w:$(LFUSE):m\
	    -U hfuse:w:$(HFUSE):m

readfuses:
	sudo avrdude -p $(MMCU) -P usb -c avrisp2 -F -u -U hfuse:r:hfuse:h \
		-U lfuse:r:lfuse:h -U efuse:r:efuse:h

clean:
	rm -f $(BIN).elf
	rm -f $(BIN).o
	rm -f $(BIN).hex
	rm -f $(BIN).out.s

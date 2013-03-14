#
# Makefile for the AVR Framebuffer Image Converter
#

# The image to use when using make run
IMAGE = ../images/tron-guys.png

SRC = $(wildcard *.cs)
BIN = image-converter

all: $(BIN)

$(BIN): $(SRC)
	@mcs -r:System.Drawing -out:$(BIN) $(SRC)

run: all
	@mono $(BIN) $(IMAGE)

clean:
	rm -f $(BIN)

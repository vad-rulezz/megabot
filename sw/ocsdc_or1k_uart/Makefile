CC = or1k-elf-gcc
OBJCOPY = or1k-elf-objcopy
OBJDUMP = or1k-elf-objdump
REMOVE = rm -rf
# Compiler flags
CFLAGS = -c -Wall -Wno-unused-function -g3 -std=c99 -O2 #-I./ -Idrivers/ -Isynth/
# Linker flags
LDFLAGS = -mnewlib -lm

# Sources
TARGET = sdc_example.c
SRC = $(TARGET)
SRC+= ocsdc.c
SRC+= mmc.c
SRC+= uart.c

# Output filename
OUT = sdc_example

# Object defines
COBJ = $(SRC:.c=.o)

all: $(SRC) $(OUT) $(OUT).bin

$(OUT).bin: $(OUT)
	$(OBJCOPY) -O binary $< $@

$(OUT): $(COBJ)
	$(CC) $(COBJ) $(LDFLAGS) -o $@

$(COBJ) : %.o : %.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	$(REMOVE) $(COBJ) $(OUT) $(OUT).bin
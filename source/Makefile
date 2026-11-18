ifeq ($(strip $(DEVKITXENON)),)
$(error DEVKITXENON is not set)
endif

TARGET  := linklist
CC      := xenon-gcc
CFLAGS  := -O2 -Wall -m32 -mpowerpc64 -I$(DEVKITXENON)/usr/include
LDFLAGS := -n -T $(DEVKITXENON)/app.lds -L$(DEVKITXENON)/xenon/lib/32 -L$(DEVKITXENON)/usr/lib
LIBS    := -lxenon -lm

all: $(TARGET).elf32

$(TARGET).elf: source/main.c
	$(CC) $(CFLAGS) $< $(LDFLAGS) $(LIBS) -o $@

$(TARGET).elf32: $(TARGET).elf
	xenon-objcopy -O elf32-powerpc $< $@

clean:
	rm -f $(TARGET).elf $(TARGET).elf32

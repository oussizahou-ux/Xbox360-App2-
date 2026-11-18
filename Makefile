ifeq ($(strip $(DEVKITXENON)),)
$(error DEVKITXENON is not set)
endif

.RECIPEPREFIX := >
TARGET  := linklist
CC      := xenon-gcc
MACHDEP := -DXENON -m32 -mno-altivec -fno-pic -mpowerpc64 -mhard-float
CFLAGS  := -O2 -Wall $(MACHDEP) -I$(DEVKITXENON)/usr/include
LDFLAGS := $(MACHDEP) -n -T $(DEVKITXENON)/app.lds -L$(DEVKITXENON)/xenon/lib/32 -L$(DEVKITXENON)/usr/lib
LIBS    := -lxenon -lm

all: $(TARGET).elf32

$(TARGET).elf: source/main.c
> $(CC) $(CFLAGS) $< $(LDFLAGS) $(LIBS) -o $@

$(TARGET).elf32: $(TARGET).elf
> xenon-objcopy -O elf32-powerpc --adjust-vma 0x80000000 $< $@

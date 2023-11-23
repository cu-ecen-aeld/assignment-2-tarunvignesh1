CC = gcc
CFLAGS = -Wall -Wextra -pedantic -std=c99
TARGET = writer

ifeq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)
	CC := $(CROSS_COMPILE)$(CC)
endif

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	rm -f $(TARGET) *.o

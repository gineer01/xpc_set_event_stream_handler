#!/bin/make -f

CCFLAGS ?= -Wno-unused-variable

all: clean xpc_set_event_stream_handler

%.o: %.m
	$(CC) -Wall $(CCFLAGS) -c -o $@ $<

xpc_set_event_stream_handler: xpc_set_event_stream_handler.o
	$(CC) -Wall $(CCFLAGS) -o $@ -lobjc -framework Foundation $<

install: xpc_set_event_stream_handler
	install xpc_set_event_stream_handler /usr/local/bin

clean:
	$(RM) *.o xpc_set_event_stream_handler


.PHONY: all clean 

CC=gcc
CFLAGS = -Wall -Werror -pedantic -pedantic-errors
CSTD = c99

.PHONY: build clean test

build:
	@$(CC) tp1.c common.c -o common

asm:
	@$(CC) tp1.c -S common.c

clean: 
	@rm -f *.o common

test: build
	@./run_tests.sh

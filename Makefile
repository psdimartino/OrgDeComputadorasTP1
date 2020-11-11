CC=gcc
CFLAGS = -Wall -Werror -pedantic -pedantic-errors
CSTD = c99

.PHONY: build clean test

build:
	@$(CC) tp1.c common.c -o common

clean: 
	@rm -f *.o common

test: build
	@./run_tests.sh

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <getopt.h>
#include <limits.h>
#include "common.h"

void print_help() {
    printf(
        "common -h\n"
        "Usage:\n"
        "common -h\n"
        "common -V\n"
        "common [options] M N\n"
        "Options:\n"
        "-h, --help     Prints usage information.\n"
        "-V, --version  Prints version information.\n"
        "-o, --output   Path to output file.\n"
        "-d  --divisor  Just the divisor\n"
        "-m  --multiple Just the multiple\n"
        "Examples:\n"
        "common -o - 256 192\n");
}
static struct option long_options[] = {
    {"version", no_argument, 0, 'V'},
    {"help", no_argument, 0, 'h'},
    {"output", required_argument, 0, 'o'},
    {"divisor", no_argument, 0, 'd'},
    {"multiple", no_argument, 0, 'm'},
    {0, 0, 0, 0}
};

int main(int argc, char *argv[]) {
    int opt_index = 1;
    char opt;
    char* output = NULL;
    bool divisor = true, multiple = true;
    unsigned int aux = 0, m = 0, n = 0;

    if (argc < 2) {
        printf("Error: No arguments. Usage:\n");
        print_help();
        return EXIT_FAILURE;
    }

    while ((opt = getopt_long(argc, argv, "Vho:dm",
                              long_options, &opt_index)) != -1) {
        switch (opt) {
            case 'V':
                printf("Version 1.0.0\n");
                return EXIT_SUCCESS;
            case 'h':
                print_help();
                return EXIT_SUCCESS;
            case 'o':
                output = optarg;
                break;
            case 'd':
                multiple = false;
                break;
            case 'm':
                divisor = false;
                break;
            default:
                printf("Error: Invalid argument/s. Usage:\n");
                print_help();
                return EXIT_FAILURE;
        }
    }
    if ( (m = atoi(argv[argc-2]) ) == UINT_MAX ) {
        printf("Error: Out of range. Use smaller numbers.\n");
        return EXIT_FAILURE;
    }
    if ( (n = atoi(argv[argc-1]) ) == UINT_MAX ) {
        printf("Error: Out of range. Use smaller numbers.\n");
        return EXIT_FAILURE;
    }
    if ( divisor ) {
        aux = mcd(m, n);
        printf("%u\n", aux);
    }

    if ( multiple ) {
        aux = mcm(m, n);
        printf("%u\n", aux);
    }

    return EXIT_SUCCESS;
}

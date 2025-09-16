#include <stdio.h>
#include <stdlib.h>

void _assert(unsigned long why, char *file, unsigned long line)
{
    if (why == 0)
	fprintf(stderr, "assert failed");
    fprintf(stderr, " at line %d in file %s\n", line, file);
    exit (-1);
}

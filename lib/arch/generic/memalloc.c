#include <stdlib.h>

void * memalloc(unsigned long size, unsigned long align)
{
    return malloc(size);
}

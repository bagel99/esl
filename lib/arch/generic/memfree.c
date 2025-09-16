#include <stdlib.h>

void memfree(char *adr, unsigned long align)
{
    free(adr);
}

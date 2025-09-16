#include <stdbool.h>

_Bool memcmp1(char src1[], char src2[], unsigned long len)
{
    for (unsigned long i = 0; i < len; i++)
    {   if (src1[i] != src2[i])
	    return false;
    }
    return true;
}

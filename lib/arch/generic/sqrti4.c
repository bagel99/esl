/*
 * Square root of unsigned integer
 * Returned value is rounded towards zero.
 * Adapted from Hacker's Delight
 */

unsigned sqrti4(unsigned x)
{   unsigned m, b, y;

    m = 0x40000000;
    y = 0;
    do
    {	b = y | m;
	y = y >> 1;
	if (x >= b)
	{   x -= b;
	    y |= m;
	}
	m = m >> 2;
    } while (m > 0);
    return y;
}


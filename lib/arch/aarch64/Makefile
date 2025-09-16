ARCH=aarch64

OBJS=	assert.o memset.o memlen.o memcpy.o memcmp.o mem.o \
		sqrti2.o sqrti4.o sqrti8.o

all:	lib.a

lib.a:	$(OBJS)
	ar cr lib.a $(OBJS)

assert.o: ../generic/assert.c
	gcc -O3 -c ../generic/assert.c -o assert.o

sqrti2.o: ../generic/sqrti2.c
	gcc -O3 -c ../generic/sqrti2.c -o sqrti2.o

sqrti4.o: ../generic/sqrti4.c
	gcc -O3 -c ../generic/sqrti4.c -o sqrti4.o

sqrti8.o: ../generic/sqrti8.c
	gcc -O3 -c ../generic/sqrti8.c -o sqrti8.o

memset.o: memset.S
	gcc -c memset.S -o memset.o

memcmp.o: memcmp.S
	gcc -c memcmp.S -o memcmp.o

memlen.o: memlen.S
	gcc -c memlen.S -o memlen.o

memcpy.o: memcpy.S
	gcc -c memcpy.S -o memcpy.o

clean:
	rm -f lib.a *.s *.o


ESLC=   eslc
ARCH=	x86_64
GCC=	gcc
LIB=    ../..


all:	lib.a

lib.a:	assert.o memcmp.o memlen.o
	ar cr lib.a assert.o memcmp.o memlen.o

assert.o: $(LIB)/assert.esl
	eslc -m$(ARCH) -I$(LIB) $(LIB)/assert.esl
	gcc -c assert.s -o assert.o

memcmp.o: memcmp.S
	gcc -c memcmp.S -o memcmp.o

memlen.o: memcmp.S
	gcc -c memlen.S -o memlen.o


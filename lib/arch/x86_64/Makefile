ESLC=   eslc -Y
ARCH=	x86_64
GCC=	gcc
LIB=    ../..

OBJS=	assert.o \
	sqrti2.o sqrti4.o sqrti8.o \
	memcmp.o memlen.o
	
all:	lib.a

lib.a:	$(OBJS)
	ar cr lib.a $(OBJS)

assert.o: $(LIB)/assert.esl
	$(ESLC) -m$(ARCH) -I$(LIB) $<
	gcc -c assert.s -o assert.o

sqrti2.o: $(LIB)/sqrti2.esl
	$(ESLC) -m$(ARCH) -I$(LIB) $<
	gcc -c sqrti2.s -o sqrti2.o

sqrti4.o: $(LIB)/sqrti4.esl
	$(ESLC) -m$(ARCH) -I$(LIB) $<
	gcc -c sqrti4.s -o sqrti4.o

sqrti8.o: $(LIB)/sqrti8.esl
	$(ESLC) -m$(ARCH) -I$(LIB) $<
	gcc -c sqrti8.s -o sqrti8.o

sqrtq4.o: $(LIB)/sqrtq4.esl
	$(ESLC) -m$(ARCH) -I$(LIB) $<
	gcc -c sqrtq4.s -o sqrtq4.o

memcmp.o: memcmp.S
	gcc -c memcmp.S -o memcmp.o

memlen.o: memcmp.S
	gcc -c memlen.S -o memlen.o

clean:
	rm -f lib.a *.s *.o


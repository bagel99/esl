ARCH=	x86_64

OBJS=	assert.o memcmp.o memlen.o mem.o \
	sqrti2.o sqrti4.o sqrti8.o

all:	lib.a

lib.a:	$(OBJS)
	ar cr lib.a $(OBJS)

assert.o: assert.S
	gcc -c assert.S -o assert.o

sqrti2.o: sqrti2.S
	gcc -c sqrti2.S -o sqrti2.o

sqrti4.o: sqrti4.S
	gcc -c sqrti4.S -o sqrti4.o

sqrti8.o: sqrti8.S
	gcc -c sqrti8.S -o sqrti8.o

memcmp.o: memcmp.S
	gcc -c memcmp.S -o memcmp.o

memlen.o: memlen.S
	gcc -c memlen.S -o memlen.o

clean:
	rm -f lib.a *.s *.o


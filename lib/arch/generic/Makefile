OBJS=	memlen.o memcmp.o memalloc.o memfree.o assert.o \
		sqrti2.o sqrti4.o sqrti8.o

CFLAGS=-O3

lib.a : $(OBJS)
	ar -cr lib.a $(OBJS)

AS=	aarch64-linux-gnu-as
LD=	aarch64-linux-gnu-ld
DUMP= 	aarch64-linux-gnu-objdump
NM=	aarch64-linux-gnu-nm
ESLC=	eslc
OPT=	-O3

OBJS=	memset.o memlen.o memcpy.o memcmp.o mem.o

%.o: %.S
	$(AS) -o $@ $<

%.dis: %.out
	$(DUMP) -d $< >$@

%.map: %.out
	$(NM) -n $< >$@

%.out: %.o
#	$(GCC) -Wl,-M -nostdlib -nostartfiles crt0.o $< memset.o -o $@
	$(LD) -Ttest.ld crt0.o $< lib.a -o $@

%.s: %.esl
	$(ESLC) -maarch64 $<

all:	crt0.o lib.a

lib.a:	$(OBJS)	
	$(AR) r lib.a $(OBJS)

clean:
	rm -f *.o *.a


ESLC=   ../../src/eslc2
LLVM=   ../../src/llvm
ARCH:= $(shell uname -m)
OPT=
GCC=	gcc
LIB=	../../lib/arch/$(ARCH)
INC=	-I../../lib


# keep intermediate files, for now
.SECONDARY: %.s %.ll

%.out: %.s
	$(GCC)  $< $(LIB)/lib.a -o $@

%.s: %.ll
	$(LLVM) -m$(ARCH) $<

%.ll: %.esl
	$(ESLC) -m$(ARCH) $(INC) $(OPT) $< >$@

all:	test-cordic-fix32.out test-cordic-fix16.out

clean:
	rm -f *.ll *.s *.o *.out


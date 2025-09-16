
SRC =	main.esl lex.esl type1.esl type2.esl symb1.esl symb2.esl \
	expr1.esl expr2.esl stmt.esl target.esl ast.esl llvm.esl \
	zstr.esl out.esl sys.esl

# LLVM is a program or script that runs the LLVM backend
# to convert a .ll into a .s for the target machine.
LLVM=./llvm
# If linking fails due to lack of PIE mode use the following
#LLVMFLAGS=-p
LLVMFLAGS=
LLVMVERSION= $(shell $(LLVM) -V)
ESLCFLAGS= -L$(LLVMVERSION) -Ilib

# C compiler is used only to run the assembler and linker
GCC=	cc
CFLAGS=

ARCH:= $(shell uname -m)
ifeq ($(ARCH), s390x)
  CFLAGS="-march=z10"
endif

LIBDIR=../lib/arch/$(ARCH)
# check to see if we need to use the generic lib
ifeq ("$(wildcard $(LIBDIR))", "")
  LIBDIR=../lib/arch/generic
endif
LIB=$(LIBDIR)/lib.a

BOOT=main-start-$(ARCH).ll

all: $(LIB) boot

# make the lib.a
$(LIB):
	$(MAKE) -C $(LIBDIR)

boot:	eslc0 eslc1 eslc2 eslc3
	@if cmp eslc3 eslc2; then \
	   echo "Success"; \
	   rm main-start.s main.s main.ll; \
	else echo "Bootstrap failed"; \
	fi

eslc-x86-64:	$(SRC)
	./eslc2 -m x86-64 main.esl >main.ll
	$(LLVM) -m x86-64 $(LLVMFLAGS) main.ll
	$(GCC) -o eslc-x86-64 main.s

main-start.s: $(BOOT)
	$(LLVM) -m $(ARCH) $(LLVMFLAGS) $(BOOT)
	mv main-start-$(ARCH).s main-start.s

eslc0:  main-start.s
	$(GCC) $(CFLAGS) -o eslc0 main-start.s $(LIB)

eslc1:	main.esl eslc0
	./eslc0 $(ESLCFLAGS) -m $(ARCH) -Ilib main.esl >main.ll
	$(LLVM) -m $(ARCH) $(LLVMFLAGS) main.ll
	$(GCC) $(CFLAGS) -o eslc1 main.s $(LIB)

eslc2:	main.esl eslc1
	./eslc1 $(ESLCFLAGS) -m $(ARCH) -Ilib main.esl >main.ll
	$(LLVM) -m $(ARCH) $(LLVMFLAGS) main.ll
	$(GCC) $(CFLAGS) -o eslc2 main.s $(LIB)

eslc3:	main.esl eslc2
	./eslc2 $(ESLCFLAGS) -m $(ARCH) -Ilib main.esl >main.ll
	$(LLVM) -m $(ARCH) $(LLVMFLAGS) main.ll
	$(GCC) $(CFLAGS) -o eslc3 main.s $(LIB)

start:
	./eslc3 $(ESLCFLAGS) -m x86-64 main.esl >main-start-x86_64.ll
	./eslc3 $(ESLCFLAGS) -m aarch64 main.esl >main-start-aarch64.ll
	./eslc3 $(ESLCFLAGS) -m riscv64 main.esl >main-start-riscv64.ll
	./eslc3 $(ESLCFLAGS) -m s390x main.esl >main-start-s390x.ll
	./eslc3 $(ESLCFLAGS) -m ppc64 main.esl >main-start-ppc64.ll

clean:
	rm -f main-start.s eslc0 eslc1 eslc2 eslc3


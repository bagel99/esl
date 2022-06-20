
SRC =	main.esl lex.esl type1.esl type2.esl symb1.esl symb2.esl \
	expr1.esl expr2.esl stmt.esl target.esl ast.esl llvm.esl \
	zstr.esl out.esl sys.esl

# LLVM is a program or script that runs the LLVM backend
# to convert a .ll into a .s for the target machine.
LLVM=./llvm_ll
LLVMFLAGS= -I		# no inlining to ease debugging
LLVMVERSION= $(shell $(LLVM) -V)
ESLCFLAGS= -L$(LLVMVERSION)

# C compiler is used only to run the assembler and linker
GCC=	cc

ARCH:= $(shell uname -m)
ifeq ($(ARCH), x86_64)
  CFLAGS=
  ARCH=x86-64
else
  ifeq ($(ARCH), i686)
    CFLAGS=-m32
    ARCH=x86
  else
    ifeq ($(ARCH), s390x)
      CFLAGS="-march=z10"
    endif
  endif
endif


BOOT=main-start-$(ARCH).ll

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

eslc-x86:	$(SRC)
	./eslc2 -m x86 main.esl >main.ll
	$(LLVM) -m x86 $(LLVMFLAGS) main.ll
	$(GCC) -m32 -o eslc-x86 main.s

main-start.s: $(BOOT)
	$(LLVM) -m $(ARCH) $(LLVMFLAGS) $(BOOT)
	mv main-start-$(ARCH).s main-start.s

eslc0:  main-start.s
	$(GCC) $(CFLAGS) -o eslc0 main-start.s

eslc1:	main.esl eslc0
	./eslc0 $(ESLCFLAGS) -m $(ARCH) main.esl >main.ll
	$(LLVM) -m $(ARCH) $(LLVMFLAGS) main.ll
	$(GCC) $(CFLAGS) -o eslc1 main.s

eslc2:	main.esl eslc1
	./eslc1 $(ESLCFLAGS) -m $(ARCH) main.esl >main.ll
	$(LLVM) -m $(ARCH) $(LLVMFLAGS) main.ll
	$(GCC) $(CFLAGS) -o eslc2 main.s

eslc3:	main.esl eslc2
	./eslc2 $(ESLCFLAGS) -m $(ARCH) main.esl >main.ll
	$(LLVM) -m $(ARCH) $(LLVMFLAGS) main.ll
	$(GCC) $(CFLAGS) -o eslc3 main.s

start:
	./eslc3 $(ESLCFLAGS) -m x86 main.esl >main-start-x86.ll
	./eslc3 $(ESLCFLAGS) -m x86-64 main.esl >main-start-x86-64.ll
	./eslc3 $(ESLCFLAGS) -m armv7l main.esl >main-start-armv7l.ll
	./eslc3 $(ESLCFLAGS) -m s390x main.esl >main-start-s390x.ll
	./eslc3 $(ESLCFLAGS) -m aarch64 main.esl >main-start-aarch64.ll

clean:
	rm -f main-start.s eslc0 eslc1 eslc2 eslc3


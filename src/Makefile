
SRC =	main.esl lex.esl type1.esl type2.esl symb1.esl symb2.esl \
	expr1.esl expr2.esl stmt.esl target.esl ast.esl llvm.esl \
	zstr.esl out.esl sys.esl

# LLVM is a program or script that runs the LLVM backend
# to convert a .ll into a .s for the target machine.
LLVM=./llvm
LLVMFLAG= -I		# no inlining to ease debugging

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

eslc:	eslc-x86

eslc-x86-64:	$(SRC)
	./eslc2 -m x86-64 main.esl >main.ll
	$(LLVM) -m x86-64 $(LLVMFLAG) main.ll
	$(GCC) -o eslc-x86-64 main.s

eslc-x86:	$(SRC)
	./eslc2 -m x86 main.esl >main.ll
	$(LLVM) -m x86 $(LLVMFLAG) main.ll
	$(GCC) -m32 -o eslc-x86 main.s

boot:	eslc0 eslc1 eslc2 eslc3
	@if cmp eslc3 eslc2; then \
	   echo "Success"; \
	   rm main-start.s main1.s main2.s main3.s; \
	   rm main1.ll main2.ll main3.ll; \
	else echo "Bootstrap failed"; \
	fi

main-start.s: $(BOOT)
	$(LLVM) -m $(ARCH) $(LLVMFLAG) $(BOOT)
	mv main-start-$(ARCH).s main-start.s

eslc0:  main-start.s
	$(GCC) $(CFLAGS) -o eslc0 main-start.s

main1.ll: main.esl eslc0
	./eslc0 -m $(ARCH) main.esl >main1.ll

main1.s: main1.ll
	$(LLVM) -m $(ARCH) $(LLVMFLAG) main1.ll

eslc1:	main1.s
	$(GCC) $(CFLAGS) -o eslc1 main1.s

main2.ll: main.esl eslc1
	./eslc1 -m $(ARCH) main.esl >main2.ll

main2.s: main2.ll
	$(LLVM) -m $(ARCH) $(LLVMFLAG) main2.ll

eslc2:	main2.s
	$(GCC) $(CFLAGS) -o eslc2 main2.s

main3.ll: main.esl eslc2
	./eslc2 -m $(ARCH) main.esl >main3.ll

main3.s: main3.ll
	$(LLVM) -m $(ARCH) $(LLVMFLAG) main3.ll

eslc3:	main3.s
	$(GCC) $(CFLAGS) -o eslc3 main3.s

main-start-x86-64.ll: main.esl
	./eslc3 -m x86-64 main.esl >main-start-x86-64.ll

main-start-x86.ll: main.esl
	./eslc3 -m x86 main.esl >main-start-x86.ll

main-start-s390x.ll: main.esl
	./eslc3 -m s390x main.esl >main-start-s390x.ll


clean:
	rm -f main-start.s eslc0
	rm -f main1.ll main1.s eslc1
	rm -f main2.ll main2.s eslc2
	rm -f main3.ll main3.s eslc3


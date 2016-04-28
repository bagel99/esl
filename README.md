# Embedded Systems Language
ESL is a new programming language designed to be used for efficient programming
of embedded and other "small" systems.  ESL an acronym for Embedded Systems
Language (it can be pronounced “essel”).

ESL is a typed compiled language with features that allow the programmer to
dictate the concrete representation of data values.  This distinguishes it from
languages which implement only “abstract” types or types whose representation
is architecture-dependent.  The programmer can dictate the details of data
representation, including such things as “endian-ness” and the exact placement
and packing of bits. These are necessary in dealing with external
representations of data layout, e.g., communication protocols or device
registers. Procedures can return multiple values.

The ESL compiler is a front-end for the LLVM (http://llvm.org) compiler.
The compiler is self-hosting, i.e., it is written in ESL.
It currently runs only on Linux on:
* x86
* x86_64
* S/390/z990 (tested with Hercules)
* armv7l (tested only on the Raspberry PI 2)
The compiler has been build on MacOSX/x86_64 but the process
is left as an exercise to the reader.

The compiler back-end is LLVM.
LLVM version 3.7.0 or 3.8.0 are the expected versions for the current front end.
Previous versions of LLVM require the use of the -L flag.

The compiler, in its current state, implements most of the language features.
Documentation is incomplete.

The file esl-examples.tgz contains sample code that blinks LEDs on two embedded
development platforms for ARM Cortex-M3 chips.  For many more examples,
download the code at https://github.com/bagel99/blocks-os/.

ESL, and its compiler, is being developed by Brian G. Lucas (bagel99@gmail.com
(initials "bgl" pronounced "bagel")).

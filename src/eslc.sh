#!/bin/sh
#
# Front-end script for the ESL compiler
#

# Original Author: James M. Norris
# Changes: Brian G. Lucas


#
# Set the default directory where to find the base set
# of ESL packages.
#
pkgs="-I."
eslcomp="$HOME/src/compiler/src/eslc2"		# !!! Change this if necessary
llvmdir3_4="$HOME/work/llvm-3.4/build/Release+Asserts/bin"
llvmdir3_5="$HOME/work/llvm-3.5.0/build/Release+Asserts/bin"
llvmdir3_6="$HOME/work/llvm-3.6.0/build/Release+Asserts/bin"
llvmdirT="$HOME/work/llvm/build/Release+Asserts/bin"

#
# Initialize variables
#
cflag=0
gflag=
mflag=0
no_assem=0
print_cmds=0
debug=
optimize=-O3    # default, unless command line changes it
feature=
loopthresh=10
outfile="a.out"
llvmdir=/usr/bin				# !!! Change this if necessary

#
# Clean up temporary files
#
cleanup()
{
    rm -f $esl_tmpfile $lla_tmpfile
}

usage()
{
    echo "Usage: $0"
    echo "  $0 [-V|--version]"
    echo "  $0 [-h|--help]"
    echo "Options:"
    echo "  [-c]            compile only"
    echo "  [-o <outfile>]  place output in file outfile"
    echo "  [-m <arch>]     target machine architecture"
    echo "  [-I <pkgdir>]   append directory to search imports"
    echo "  [-i]            LLVM optimizer option to disable inlining"
    echo "  [-u] <number>   LLVM optimizer loop-unroll threshold"
    echo "  [-O{0123sz}]    optimization level"
    echo "  [-g]            include debug information"
    echo "  [-D<letter>]    debug subsystem"
    echo "  [-F<letter>]    enable feature"
    echo "  [-P]            use previous released version of LLVM"
    echo "  [-T]            use test version of LLVM"
    echo "  [-v]            print the commands run"
    echo "  [-V]            print versions and exit"
}

version()
{
    $eslcomp -V
    $llvmdir/llc -version
}

# Set the default target machine architecture based upon host platform.
tarch=`uname -m`

# Parse the options
while getopts "cghim:o:O:u:vI:VD:F:MPT" flags
do
    case $flags in
    c) cflag=1 ;;
    g) gflag="-g" ;;
    h) usage; exit 0 ;;
    i) opt_opt="-disable-inlining" ;;
    m) tarch=$OPTARG ;;
    o) outfile=$OPTARG ;;
    u) loopthresh=$OPTARG ;;
    v) print_cmds=1 ;;
    I) pkgs="$pkgs -I$OPTARG" ;;
    O) optimize=-O$OPTARG ;;
    V) version; exit 0 ;;
    D) debug="$debug -D$OPTARG" ;;
    F) feature="$feature -F$OPTARG" ;;
    M) feature="$feature -M"; mflag=1 ;;
    P) llvmdir=$llvmdir3_5 ;;
    T) llvmdir=$llvmdirT ;;
    *) echo "Unknown option: $flag" ; exit 1 ;;
    esac
done
shift $(($OPTIND-1))

# Verify ESL source file
if test -z $@ || ! test -f $@
then
    usage
    exit 1
fi
src_filename=$@

# Convert ESLC target name to what front and backends need
march=
mcpu=
mattr=
case "$tarch" in
    x86| i386 | i486 | i586 | i686) tarch=x86; march=x86 ;;
    x86_64 | x86-64)    tarch=x86-64; march=x86-64 ;;
    s390x | systemz)    march=systemz ;;
    armv7l)		march=arm; mcpu="-mcpu=cortex-a7"
			mattr="-mattr=-neon,-vfp4,+vfp3,+d16";;
    cortex-m3)		march=thumb; mcpu="-mcpu=cortex-m3" ;;
    cortex-m4)          march=thumb; mcpu="-mcpu=cortex-m4"
		        mattr="-mattr=+vfp3" ;;
    cortex-a8)		march=thumb; mcpu="-mcpu=cortex-a8" ;;
    cortex-a53)		tarch=aarch64; march=aarch64; mcpu="-mcpu=cortex-a53" ;;
    cortex-a57)		tarch=aarch64; march=aarch64; mcpu="-mcpu=cortex-a57" ;;
    arm920t)		march=thumb; mcpu="-mcpu=arm920t" ;;
    *)			march=$tarch ;;
esac


#
# Generate all the temporary files
#
lla_tmpfile=`mktemp /tmp/tmp.XXXXXXXXXX` || exit 2

#
# When we exit, no matter what the reason, clean up.
#
trap cleanup 0

#
# Run the ESL compiler
#
if test $print_cmds -ne 0
then
    echo "eslcomp -m $tarch $gflag $optimize $feature $debug $pkgs $src_filename >  $lla_tmpfile"
fi
$eslcomp -m $tarch $gflag $optimize $feature $debug $pkgs $src_filename > $lla_tmpfile
if test $? -ne 0
then
    exit $?     # compile error
elif test $cflag -eq 1
then
    mv $lla_tmpfile `basename $src_filename .esl`.ll
    exit 0
elif test $mflag -eq 1
then
    mv $lla_tmpfile `basename $src_filename .esl`.dep
    exit 0
fi

#
# Run the LLVM backend
#
asm_filename=`basename $src_filename .esl`.s
if test $print_cmds -ne 0
then
    echo "opt $optimize $opt_opt -unroll-threshold=$loopthresh -o - $lla_tmpfile |"
    echo "llc -march=$march $mcpu $mattr -asm-verbose=0 -o $asm_filename"
fi
$llvmdir/opt $optimize $opt_opt -unroll-threshold=$loopthresh -o - $lla_tmpfile | \
$llvmdir/llc -march=$march $mcpu $mattr -asm-verbose=0 $optimize -o $asm_filename

## vim: ts=8 sw=4 noet nowrap


SRCPATH=.
prefix=/usr/local
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib
includedir=${prefix}/include
SYS_ARCH=X86
SYS=WINDOWS
CC=gcc
CXX=g++
CFLAGS=-Wno-maybe-uninitialized -Wshadow -O3 -ffast-math -m32  -Wall -I. -I$(SRCPATH) -march=i686 -mfpmath=sse -msse -msse2 -std=gnu99 -mpreferred-stack-boundary=5 -fomit-frame-pointer -fno-tree-vectorize -fno-zero-initialized-in-bss
CXXFLAGS=-Wno-maybe-uninitialized -Wshadow -O3 -ffast-math -m32  -Wall -I. -I$(SRCPATH) -march=i686 -mfpmath=sse -msse -msse2 -std=gnu++14 -mpreferred-stack-boundary=5 -fomit-frame-pointer -fno-tree-vectorize -fno-zero-initialized-in-bss
COMPILER=GNU
COMPILER_STYLE=GNU
DEPMM=-MM -g0
DEPMT=-MT
LD=g++ -o 
LDFLAGS=-m32   -Wl,--large-address-aware -Wl,--dynamicbase,--nxcompat,--tsaware 
AR=ar rc 
RANLIB=ranlib
STRIP=strip
INSTALL=install
AS=yasm
ASFLAGS= -I. -I$(SRCPATH) -DARCH_X86_64=0 -I$(SRCPATH)/common/x86/ -f win32 -DPREFIX -Worphan-labels -DSTACK_ALIGNMENT=32 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8
RC=windres
RCFLAGS=--target=pe-i386  -I. -o 
EXE=.exe
HAVE_GETOPT_LONG=1
DEVNULL=NUL
PROF_GEN_CC=-fprofile-generate
PROF_GEN_LD=-fprofile-generate
PROF_USE_CC=-fprofile-use
PROF_USE_LD=-fprofile-use
HAVE_OPENCL=yes
LDFLAGSCLI =  -lshell32
EXTRALIBS=-lm -lpsapi -ladvapi32 -lshell32 

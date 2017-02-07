##############################################################################
#
# Makefile for x264 VFW driver
#
# Author: XviD project:
#            - Milan Cutka <cutka at szm.sk>,
#            - Edouard Gomez <ed.gomez at free.fr>
#            - Peter Ross <pross@xvid.org>
# Ported to x264 by Laurent Aimar <fenrir@via.ecp.fr>
#
##############################################################################

# Current dir
DIR_CUR = $(shell pwd)

# Path to include files (library and src)
DIR_SRC = $(DIR_CUR)

-include config.mak

ifeq ($(SYS_ARCH),X86_64)
# Dll to build
DLL = AACACM.acm
else
# Dll to build
DLL = AACACM.acm
endif

##############################################################################
# CXXFLAGS
##############################################################################

# Constants which should not be modified
CXXFLAGS += -D_WIN32_IE=0x0501

##############################################################################
# Compiler flags for linking stage
##############################################################################

VFW_LDFLAGS = -static "-L../../faad2-2.7/libfaad/.libs" -lfaad

##############################################################################
# Conditional options
##############################################################################

# Sources
SRC_CXX = AACACM.cpp
SRC_RES = AACACM.rc

# Muxers
CONFIG =
ifneq ($(wildcard config.h)x,x)
CONFIG := $(shell cat config.h)
endif

##############################################################################
# Rules
##############################################################################

OBJECTS  = $(SRC_CXX:.cpp=.cpp.obj)
OBJECTS += $(SRC_RES:.rc=.rc.obj)

.SUFFIXES:
.SUFFIXES: .obj .rc .cpp

DIR_BUILD = $(DIR_CUR)/bin
VPATH = $(DIR_SRC):$(DIR_BUILD)

.PHONY: all clean distclean

all: $(DLL)

ifneq ($(wildcard .depend)x,x)
include .depend
endif

%.rc.obj: %.rc
	@echo " W: $(@D)/$(<F)"
	@mkdir -p "$(DIR_BUILD)/$(@D)"
	@$(RC) \
	--input-format=rc \
	--output-format=coff \
	-o "$(DIR_BUILD)/$@" $<

%.cpp.obj: %.cpp
	@echo " C: $(@D)/$(<F)"
	@mkdir -p "$(DIR_BUILD)/$(@D)"
	@$(CXX) $(CXXFLAGS) -c -o "$(DIR_BUILD)/$@" $<

.depend: config.mak
	@rm -f .depend
	@$(foreach SRC, $(SRC_CXX), $(CXX) $(CXXFLAGS) $(SRC) -MT $(SRC:%.cpp=%.cpp.obj) -MM -g0 1>> .depend;)

$(DLL): .depend config.mak config.h $(OBJECTS)
	@echo " L: $(@F)"
	@mkdir -p "$(DIR_BUILD)"
	@cp -f "$(DIR_SRC)/AACACM.bat" "$(DIR_BUILD)/AACACM.bat"
	@cp -f "$(DIR_SRC)/AACACM.inf" "$(DIR_BUILD)/AACACM.inf"
	@cp -f "$(DIR_SRC)/AACACM.def" "$(DIR_BUILD)/AACACM.def"
	@cd "$(DIR_BUILD)" && \
	$(CXX) \
	-shared -Wl,-dll,--out-implib,$@.a,--enable-stdcall-fixup \
	-o $@ \
	$(OBJECTS) AACACM.def \
	$(VFW_LDFLAGS) $(LDFLAGS) -lgdi32 -lwinmm -lcomdlg32 -lcomctl32

clean:
	@echo " Cl: Object files and target lib"
	@rm -rf "$(DIR_BUILD)"
	@echo " Cl: .depend"
	@rm -f .depend

distclean: clean
	@echo " Cl: config.mak"
	@rm -f "$(DIR_CUR)/config.mak"
	@echo " Cl: config.h"
	@rm -f "$(DIR_CUR)/config.h"

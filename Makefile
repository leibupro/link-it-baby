# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <leiu@zhaw.ch> wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   P. Leibundgut
# ----------------------------------------------------------------------------
 
CC := gcc
LD := $(CC)

GCF := -g -O0

SRCDIR     := ./src
INCDIR     := ./include

OBJDIR     := ./obj
OBJDIRSTAT := ./obj_stat
OBJDIRDYN  := ./obj_dyn

LIBDIR := ./lib
BINDIR := ./bin

SRCAPP := $(SRCDIR)/main.c
SRCLIB := $(SRCDIR)/arith.c

OBJAPP     := $(addprefix $(OBJDIR)/,     $(notdir $(SRCAPP:.c=.o)))
OBJLIBSTAT := $(addprefix $(OBJDIRSTAT)/, $(notdir $(SRCLIB:.c=.o)))
OBJLIBDYN  := $(addprefix $(OBJDIRDYN)/,  $(notdir $(SRCLIB:.c=.o)))

LIBSTAT     := $(LIBDIR)/libarith.a
LIBDYN      := $(LIBDIR)/libarith.so.1.0.1
LIBDYNNAME  := libarith.so.1

LIBNAME     := arith

BINS := $(BINDIR)/a_statically_linked_program
BIND := $(BINDIR)/a_dynamically_linked_program

# for pattern rules to look into 
# this directory for source files
VPATH := $(SRCDIR)


.PHONY: all static dynamic apps appd clean


all: static dynamic


static: apps

dynamic: appd


apps: $(BINS)

appd: $(BIND)


# linking of the binaries
$(BINS): $(LIBSTAT) $(OBJAPP) $(BINDIR)
	$(LD) -static -o $@ $(OBJAPP) -L$(LIBDIR) -l$(LIBNAME)

$(BIND): $(LIBDYN) $(OBJAPP) $(BINDIR)
	$(LD) -o $@ $(OBJAPP) -L$(LIBDIR) -l$(LIBNAME)


# libraries
$(LIBSTAT): $(LIBDIR) $(OBJLIBSTAT)
	ar rcs $@ $(OBJLIBSTAT)

$(LIBDYN): $(LIBDIR) $(OBJLIBDYN)
	$(LD) -shared -Wl,-soname,$(LIBDYNNAME) -o $@ $(OBJLIBDYN)


# directories
$(OBJDIR):
	mkdir $@
$(OBJDIRSTAT):
	mkdir $@
$(OBJDIRDYN):
	mkdir $@
$(LIBDIR):
	mkdir $@
$(BINDIR):
	mkdir $@


# pattern rules
$(OBJDIR)/%.o: %.c $(OBJDIR)
	$(CC) $(GCF) -I$(INCDIR) -c $< -o $@

$(OBJDIRSTAT)/%.o: %.c $(OBJDIRSTAT)
	$(CC) $(GCF) -I$(INCDIR) -c $< -o $@

$(OBJDIRDYN)/%.o: %.c $(OBJDIRDYN)
	$(CC) $(GCF) -fPIC -I$(INCDIR) -c $< -o $@


clean:
	@if [ -d $(OBJDIR) ]; then \
    rm -rf $(OBJDIR); \
  fi
	@if [ -d $(OBJDIRSTAT) ]; then \
    rm -rf $(OBJDIRSTAT); \
  fi
	@if [ -d $(OBJDIRDYN) ]; then \
    rm -rf $(OBJDIRDYN); \
  fi
	@if [ -d $(LIBDIR) ]; then \
    rm -rf $(LIBDIR); \
  fi
	@if [ -d $(BINDIR) ]; then \
    rm -rf $(BINDIR); \
  fi


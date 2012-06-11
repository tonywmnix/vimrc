
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /usr/intel/pkgs/ruby/1.9.2-p0/include/ruby-1.9.1
hdrdir = /usr/intel/pkgs/ruby/1.9.2-p0/include/ruby-1.9.1
arch_hdrdir = /usr/intel/pkgs/ruby/1.9.2-p0/include/ruby-1.9.1/$(arch)
VPATH = $(srcdir):$(arch_hdrdir)/ruby:$(hdrdir)/ruby
prefix = $(DESTDIR)/usr/intel/pkgs/ruby/1.9.2-p0
rubylibprefix = $(libdir)/$(RUBY_BASE_NAME)
exec_prefix = $(prefix)
vendorhdrdir = $(rubyhdrdir)/vendor_ruby
sitehdrdir = $(rubyhdrdir)/site_ruby
rubyhdrdir = $(includedir)/$(RUBY_BASE_NAME)-$(ruby_version)
vendordir = $(rubylibprefix)/vendor_ruby
sitedir = $(rubylibprefix)/site_ruby
ridir = $(datarootdir)/$(RI_BASE_NAME)
mandir = $(datarootdir)/man
localedir = $(datarootdir)/locale
libdir = $(DESTDIR)/usr/intel/pkgs/ruby/1.9.2-p0/lib
psdir = $(docdir)
pdfdir = $(docdir)
dvidir = $(docdir)
htmldir = $(docdir)
infodir = $(datarootdir)/info
docdir = $(datarootdir)/doc/$(PACKAGE)
oldincludedir = $(DESTDIR)/usr/include
includedir = $(prefix)/include
localstatedir = $(prefix)/var
sharedstatedir = $(prefix)/com
sysconfdir = $(prefix)/etc
datadir = $(datarootdir)
datarootdir = $(prefix)/share
libexecdir = $(exec_prefix)/libexec
sbindir = $(exec_prefix)/sbin
bindir = $(exec_prefix)/bin
rubylibdir = $(rubylibprefix)/$(ruby_version)
archdir = $(rubylibdir)/$(arch)
sitelibdir = $(sitedir)/$(ruby_version)
sitearchdir = $(sitelibdir)/$(sitearch)
vendorlibdir = $(vendordir)/$(ruby_version)
vendorarchdir = $(vendorlibdir)/$(sitearch)

CC = /usr/intel/bin/gcc -O2 -fPIC -I/usr/intel/pkgs/libiconv/1.12-64/include -L/usr/intel/pkgs/libiconv/1.12-64/lib -I/usr/intel/pkgs/gdbm/1.8.3/include -L/usr/intel/pkgs/gdbm/1.8.3/lib -I/usr/intel/pkgs/tcl-tk/8.5.8-64/include -L/usr/intel/pkgs/tcl-tk/8.5.8-64/lib64 -I/usr/intel/pkgs/X11/R7.5/include -L/usr/intel/pkgs/X11/R7.5/ -I/usr/intel/pkgs/groff/1.20.1/include -L/usr/intel/pkgs/groff/1.20.1/ -I/usr/intel/pkgs/fontconfig/2.7.3/include -L/usr/intel/pkgs/fontconfig/2.7.3/ -I/usr/intel/pkgs/libexpat/2.0.1-32/include -L/usr/intel/pkgs/libexpat/2.0.1-32/ -I/usr/intel/pkgs/freetype/2.3.7/include -L/usr/intel/pkgs/freetype/2.3.7/ -I/usr/intel/pkgs/zlib/1.2.x/include -L/usr/intel/pkgs/zlib/1.2.x/ -I/usr/intel/pkgs/readline/5.0-64/include -L/usr/intel/pkgs/readline/5.0-64/lib -I/usr/intel/pkgs/openssl/0.9.8/include -L/usr/intel/pkgs/openssl/0.9.8/lib -I/usr/intel/pkgs/ncurses/5.6-64/include -L/usr/intel/pkgs/ncurses/5.6-64/lib64  -I/usr/intel/pkgs/ruby/1.9.2-p0/include -L/usr/intel/pkgs/ruby/1.9.2-p0/lib -L/usr/intel/pkgs/ruby/1.9.2-p0/lib -Wl,-rpath=/usr/intel/pkgs/libiconv/1.12-64/lib:/usr/intel/pkgs/gdbm/1.8.3/lib:/usr/intel/pkgs/tcl-tk/8.5.8-64/lib64:/usr/intel/pkgs/X11/R7.5/:/usr/intel/pkgs/groff/1.20.1/:/usr/intel/pkgs/fontconfig/2.7.3/:/usr/intel/pkgs/libexpat/2.0.1-32/:/usr/intel/pkgs/freetype/2.3.7/:/usr/intel/pkgs/zlib/1.2.x/:/usr/intel/pkgs/readline/5.0-64/lib:/usr/intel/pkgs/openssl/0.9.8/lib:/usr/intel/pkgs/ncurses/5.6-64/lib64:/usr/intel/pkgs/ruby/1.9.2-p0/lib
CXX = /usr/intel/bin/g++
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -Wl,-R -Wl,$(libdir) -L$(libdir) -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -Wl,-R -Wl,$(libdir) -L$(libdir) -l$(RUBY_SO_NAME)-static
OUTFLAG = -o 
COUTFLAG = -o 

RUBY_EXTCONF_H = 
cflags   =  $(optflags) $(debugflags) $(warnflags)
optflags = -O3
debugflags = -ggdb
warnflags = -Wextra -Wno-unused-parameter -Wno-parentheses -Wpointer-arith -Wwrite-strings -Wno-missing-field-initializers -Wno-long-long
CFLAGS   = -fPIC $(cflags)  -fPIC 
INCFLAGS = -I. -I$(arch_hdrdir) -I$(hdrdir)/ruby/backward -I$(hdrdir) -I$(srcdir)
DEFS     = 
CPPFLAGS = -DHAVE_RUBY_H -I/usr/intel/pkgs/libiconv/1.12-64/include -L/usr/intel/pkgs/libiconv/1.12-64/lib -I/usr/intel/pkgs/gdbm/1.8.3/include -L/usr/intel/pkgs/gdbm/1.8.3/lib -I/usr/intel/pkgs/tcl-tk/8.5.8-64/include -L/usr/intel/pkgs/tcl-tk/8.5.8-64/lib64 -I/usr/intel/pkgs/X11/R7.5/include -L/usr/intel/pkgs/X11/R7.5/ -I/usr/intel/pkgs/groff/1.20.1/include -L/usr/intel/pkgs/groff/1.20.1/ -I/usr/intel/pkgs/fontconfig/2.7.3/include -L/usr/intel/pkgs/fontconfig/2.7.3/ -I/usr/intel/pkgs/libexpat/2.0.1-32/include -L/usr/intel/pkgs/libexpat/2.0.1-32/ -I/usr/intel/pkgs/freetype/2.3.7/include -L/usr/intel/pkgs/freetype/2.3.7/ -I/usr/intel/pkgs/zlib/1.2.x/include -L/usr/intel/pkgs/zlib/1.2.x/ -I/usr/intel/pkgs/readline/5.0-64/include -L/usr/intel/pkgs/readline/5.0-64/lib -I/usr/intel/pkgs/openssl/0.9.8/include -L/usr/intel/pkgs/openssl/0.9.8/lib -I/usr/intel/pkgs/ncurses/5.6-64/include -L/usr/intel/pkgs/ncurses/5.6-64/lib64  -I/usr/intel/pkgs/ruby/1.9.2-p0/include -L/usr/intel/pkgs/ruby/1.9.2-p0/lib -L/usr/intel/pkgs/ruby/1.9.2-p0/lib $(DEFS) $(cppflags)
CXXFLAGS = $(CFLAGS) -O2 -fPIC 
ldflags  = -L.  -rdynamic -Wl,-export-dynamic
dldflags = 
ARCH_FLAG = 
DLDFLAGS = $(ldflags) $(dldflags)
LDSHARED = $(CC) -shared
LDSHAREDXX = $(CXX) -shared
AR = ar
EXEEXT = 

RUBY_BASE_NAME = ruby
RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = x86_64-linux
sitearch = $(arch)
ruby_version = 1.9.1
ruby = /usr/intel/pkgs/ruby/1.9.2-p0/bin/ruby
RUBY = $(ruby)
RM = rm -f
RM_RF = $(RUBY) -run -e rm -- -rf
RMDIRS = $(RUBY) -run -e rmdir -- -p
MAKEDIRS = /usr/intel/bin/gmkdir -p
INSTALL = /usr/intel/bin/ginstall -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir)
LIBPATH =  -L. -L$(libdir) -Wl,-R$(libdir)
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 
DISTCLEANDIRS = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED)  -lpthread -lrt -ldl -lcrypt -lm   -lc
SRCS = ext.c match.c matcher.c
OBJS = ext.o match.o matcher.o
TARGET = ext
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR    = $(sitelibdir)$(target_prefix)
RUBYARCHDIR   = $(sitearchdir)$(target_prefix)
HDRDIR        = $(rubyhdrdir)/ruby$(target_prefix)
ARCHHDRDIR    = $(rubyhdrdir)/$(arch)/ruby$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).so 
CLEANOBJS     = *.o  *.bak

all:    $(DLLIB)
static: $(STATIC_LIB)
.PHONY: all install static install-so install-rb
.PHONY: clean clean-so clean-rb

clean-rb-default::
clean-rb::
clean-so::
clean: clean-so clean-rb-default clean-rb
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean-rb-default::
distclean-rb::
distclean-so::
distclean: clean distclean-so distclean-rb-default distclean-rb
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)
		@-$(RMDIRS) $(DISTCLEANDIRS)

realclean: distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	@-$(MAKEDIRS) $(@D)
	$(INSTALL_PROG) $(DLLIB) $(@D)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -c $<

$(DLLIB): $(OBJS) Makefile
	@-$(RM) $(@)
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



###
# Copyright 2010 Wincent Colaiuta. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

CFLAGS += -std=c99 -Wall -Wextra -Wno-unused-parameter

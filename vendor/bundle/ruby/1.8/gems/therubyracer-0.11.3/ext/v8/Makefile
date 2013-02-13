
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /usr/lib/ruby/1.8/x86_64-linux
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
exec_prefix = $(prefix)
prefix = $(DESTDIR)/usr
rubylibdir = $(libdir)/ruby/$(ruby_version)
sharedstatedir = $(prefix)/com
sitedir = $(libdir)/ruby/site_ruby
mandir = $(datarootdir)/man
sysconfdir = $(prefix)/etc
localstatedir = $(prefix)/var
dvidir = $(docdir)
psdir = $(docdir)
includedir = $(prefix)/include
sbindir = $(exec_prefix)/sbin
datarootdir = $(prefix)/share
sitelibdir = $(sitedir)/$(ruby_version)
bindir = $(exec_prefix)/bin
localedir = $(datarootdir)/locale
oldincludedir = $(DESTDIR)/usr/include
infodir = $(datarootdir)/info
sitearchdir = $(sitelibdir)/$(sitearch)
archdir = $(rubylibdir)/$(arch)
datadir = $(datarootdir)
htmldir = $(docdir)
pdfdir = $(docdir)
libexecdir = $(exec_prefix)/libexec
vendorlibdir = $(vendordir)/$(ruby_version)
vendorarchdir = $(vendorlibdir)/$(sitearch)
vendordir = $(libdir)/ruby/vendor_ruby
libdir = $(exec_prefix)/lib
docdir = $(datarootdir)/doc/$(PACKAGE)

CC = gcc
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -Wl,-R -Wl,$(libdir) -L$(libdir) -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = 
CFLAGS   =  -fPIC -g -O2  -fPIC $(cflags) 
INCFLAGS = -I. -I/home/raidrinc/jba/vendor/bundle/ruby/1.8/gems/libv8-3.11.8.13-x86_64-linux/vendor/v8/include -I. -I/usr/lib/ruby/1.8/x86_64-linux -I.
DEFS     = 
CPPFLAGS =     -Wall -g -rdynamic
CXXFLAGS = $(CFLAGS) 
ldflags  = /home/raidrinc/jba/vendor/bundle/ruby/1.8/gems/libv8-3.11.8.13-x86_64-linux/vendor/v8/out/x64.release/obj.target/tools/gyp/libv8_base.a /home/raidrinc/jba/vendor/bundle/ruby/1.8/gems/libv8-3.11.8.13-x86_64-linux/vendor/v8/out/x64.release/obj.target/tools/gyp/libv8_snapshot.a -L.  -rdynamic -Wl,-export-dynamic
dldflags = 
archflag = 
DLDFLAGS = $(ldflags) $(dldflags) $(archflag)
LDSHARED = $(CXX) -shared
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = x86_64-linux
sitearch = x86_64-linux
ruby_version = 1.8
ruby = /usr/bin/ruby
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
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

extout = 
extout_prefix = 
target_prefix = /v8
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED) -lpthread  -lrt -ldl -lcrypt -lm   -lc
SRCS = stack.cc external.cc invocation.cc gc.cc string.cc init.cc rr.cc backref.cc accessor.cc message.cc constraints.cc signature.cc trycatch.cc exception.cc object.cc template.cc value.cc array.cc function.cc v8.cc heap.cc handles.cc constants.cc context.cc locker.cc primitive.cc date.cc script.cc
OBJS = stack.o external.o invocation.o gc.o string.o init.o rr.o backref.o accessor.o message.o constraints.o signature.o trycatch.o exception.o object.o template.o value.o array.o function.o v8.o heap.o handles.o constants.o context.o locker.o primitive.o date.o script.o
TARGET = init
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /home/raidrinc/jba/vendor/bundle/ruby/1.8/gems/therubyracer-0.11.3/lib$(target_prefix)
RUBYARCHDIR = /home/raidrinc/jba/vendor/bundle/ruby/1.8/gems/therubyracer-0.11.3/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).so $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
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
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS) Makefile
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h

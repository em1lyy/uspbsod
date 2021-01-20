NAME = uspbsod
VERSION = 1.0

OUTDIR = bin

CC = x86_64-w64-mingw32-gcc
LD = $(CC)
CPPFLAGS =
CFLAGS   = -Wall -Os -Iinclude
LDFLAGS  = -s -Iinclude -lntdll

RAISEOBJ = ntraise/ntraise.o
OPENOBJ = openmal/openmal.o

RAISEBIN = ntraise/ntraise.exe
OPENBIN = openmal/openmal.exe

OBJECTS = $(RAISEOBJ) $(OPENOBJ)
BINARIES = $(RAISEBIN) $(OPENBIN)

all: $(BINARIES)

%.exe: %.o
	@echo LD $<
	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS)
	mv $@ $(OUTDIR)

%.o: %.c %.h
	@echo CC $<
	$(CC) $(CFLAGS) -c -o $@ $<

install: all
	@echo nothing to install

uninstall:
	@echo nothing to uninstall

dist: clean
	mkdir -p $(NAME)-$(VERSION)
	cp LICENSE Makefile README $(NAME)-$(VERSION)
	cp ntraise openmal $(NAME)-$(VERSION)
	tar -cf $(NAME)-$(VERSION).tar $(NAME)-$(VERSION)
	gzip $(NAME)-$(VERSION).tar
	rm -rf $(NAME)-$(VERSION)

clean:
	rm -f $(OBJECTS) $(BINARIES) $(NAME)-$(VERSION).tar.gz

.PHONY:
	all install uninstall dist clean

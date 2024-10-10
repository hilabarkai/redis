# Top level makefile, the real stuff is at ./src/Makefile and in ./modules/Makefile

SUBDIRS = src
ifeq ($(BUILD_WITH_MODULES), yes)
	SUBDIRS += modules
endif

default: all

.DEFAULT:
	for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

install:
	for dir in $(SUBDIRS); do $(MAKE) INSTALL_PREFIX=$(DESTDIR) -C $$dir $@; done
	mkdir -p debian/tmp/usr/local/bin
    cp -ra /usr/local/bin/* debian/tmp/usr/local/bin

.PHONY: install

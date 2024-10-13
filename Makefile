# Top level makefile, the real stuff is at ./src/Makefile and in ./modules/Makefile

SUBDIRS = src
ifeq ($(BUILD_WITH_MODULES), yes)
	SUBDIRS += modules
endif

default: all

.DEFAULT:
	for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

install:
    @echo "Installing ..."
	for dir in $(SUBDIRS); do $(MAKE) PREFIX=$(DESTDIR) -C $$dir $@; done
	@echo "Installation complete."
    @find / -name "redis-*" -print

.PHONY: install

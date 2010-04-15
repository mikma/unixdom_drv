MK_INCLUDE=../support/include.mk
JERL=../bin/jerl

all: config.status $(MK_INCLUDE) $(JERL)

config.status: configure
	./configure
	chmod +x $(JERL)

$(JERL) $(MK_INCLUDE): config.status ../support/include.mk.in ../bin/jerl.in
	./config.status
	chmod +x $(JERL)

configure: configure.in
	autoheader
	autoconf

clean:

distclean:
	-$(RM) autom4te.cache config.cache config.log config.status \
               $(MK_INCLUDE) $(JERL)

#extra-clean rm config.h.in configure

install:

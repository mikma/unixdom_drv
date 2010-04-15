SUBDIRS = \
	config \
	c_src \
	src

DISTCLEAN_SUBDIRS = \
	c_src \
	src \
	config

RECURSIVE_TARGETS = all-recursive clean-recursive distclean-recursive

all: all-recursive

$(RECURSIVE_TARGETS):
	@target=`echo $@ | sed s/-recursive//`; \
	list='$(SUBDIRS)'; for subdir in $$list; do \
	echo "Making $$target in $$subdir"; \
	(cd $$subdir && $(MAKE) ERLC_FLAGS="$(ERLC_FLAGS)" $$target) || exit 1; \
	done

clean: clean-recursive

$(MK_INCLUDE): $(MK_INCLUDE).in
	$(MAKE) conf

conf:
	(cd config && $(MAKE))

distclean: SUBDIRS=$(DISTCLEAN_SUBDIRS)
distclean: clean distclean-recursive

config/configure: config/configure.in
	(cd config && autoconf)


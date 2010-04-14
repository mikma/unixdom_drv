all: conf
	$(MAKE) -C c_src
	$(MAKE) -C src

clean:
	$(MAKE) -C c_src $@
	$(MAKE) -C src $@

$(MK_INCLUDE): $(MK_INCLUDE).in
	$(MAKE) conf

conf:
	(cd config; $(MAKE))

conf_clean:
	(cd config; $(MAKE) clean)

config/configure: config/configure.in
	(cd config; autoconf)


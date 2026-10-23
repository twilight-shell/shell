PREFIX ?= /usr
QMLDIR ?= $(PREFIX)/lib/qt6/qml

# The components, in the order they are installed: what the others need first.
ALL = core compositor app-launcher bar popouts notifications lock wallpaper osd mascot settings plugins

# `make install ONLY="bar"` installs those components, with what they need, and
# not the shell that puts them together.
ONLY ?=
ifneq ($(filter-out $(ALL),$(ONLY)),)
$(error unknown component: $(filter-out $(ALL),$(ONLY)); the components are $(ALL))
endif

# The repository that has the module Twilight.<name>, and what a component needs
# (the DEPENDS of its repository, without the nice-to-haves marked with a ?).
provider = $(word 2,$(subst /, ,$(firstword $(wildcard modules/*/Twilight/$(1)))))
needs = $(foreach m,$(shell sed 's/\#.*//' modules/$(1)/DEPENDS 2>/dev/null | grep -v '^?'),$(call provider,$(m)))
closure = $(sort $(1) $(foreach r,$(1),$(call needs,$(r))))
CHOSEN = $(if $(ONLY),$(call closure,$(call closure,$(call closure,$(ONLY)))),$(ALL))
MODULES = $(filter $(CHOSEN),$(ALL))

install:
	for m in $(MODULES); do \
		$(MAKE) -C modules/$$m install PREFIX=$(PREFIX) QMLDIR=$(QMLDIR) DESTDIR=$(DESTDIR) || exit 1; \
	done
ifneq ($(filter lock,$(MODULES)),)
	for f in shell.qml preview.qml LayoutSource.qml; do \
		install -Dm644 modules/lock/$$f $(DESTDIR)$(PREFIX)/share/twilight-shell/lock/$$f; \
	done
endif
ifeq ($(ONLY),)
	install -Dm644 shell.qml $(DESTDIR)$(PREFIX)/share/twilight-shell/shell.qml
	install -Dm755 bin/twilight-shell $(DESTDIR)$(PREFIX)/bin/twilight-shell
endif

uninstall:
	for m in $(MODULES); do \
		$(MAKE) -C modules/$$m uninstall PREFIX=$(PREFIX) QMLDIR=$(QMLDIR) DESTDIR=$(DESTDIR); \
	done
ifeq ($(ONLY),)
	rm -rf $(DESTDIR)$(PREFIX)/share/twilight-shell
	rm -f $(DESTDIR)$(PREFIX)/bin/twilight-shell
endif

.PHONY: install uninstall

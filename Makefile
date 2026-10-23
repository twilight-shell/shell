PREFIX ?= /usr
QMLDIR ?= $(PREFIX)/lib/qt6/qml
MODULES = core compositor app-launcher bar popouts notifications

install:
	for m in $(MODULES); do \
		$(MAKE) -C modules/$$m install PREFIX=$(PREFIX) QMLDIR=$(QMLDIR) DESTDIR=$(DESTDIR) || exit 1; \
	done
	install -Dm644 shell.qml $(DESTDIR)$(PREFIX)/share/twilight-shell/shell.qml
	install -Dm755 bin/twilight-shell $(DESTDIR)$(PREFIX)/bin/twilight-shell

uninstall:
	for m in $(MODULES); do \
		$(MAKE) -C modules/$$m uninstall PREFIX=$(PREFIX) QMLDIR=$(QMLDIR) DESTDIR=$(DESTDIR); \
	done
	rm -rf $(DESTDIR)$(PREFIX)/share/twilight-shell
	rm -f $(DESTDIR)$(PREFIX)/bin/twilight-shell

.PHONY: install uninstall

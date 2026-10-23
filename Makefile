PREFIX ?= /usr
QMLDIR ?= $(PREFIX)/lib/qt6/qml
MODULES = core compositor app-launcher bar popouts notifications lock

install:
	for m in $(MODULES); do \
		$(MAKE) -C modules/$$m install PREFIX=$(PREFIX) QMLDIR=$(QMLDIR) DESTDIR=$(DESTDIR) || exit 1; \
	done
	install -Dm644 shell.qml $(DESTDIR)$(PREFIX)/share/twilight-shell/shell.qml
	for f in shell.qml preview.qml LayoutSource.qml; do \
		install -Dm644 modules/lock/$$f $(DESTDIR)$(PREFIX)/share/twilight-shell/lock/$$f; \
	done
	install -Dm755 bin/twilight-shell $(DESTDIR)$(PREFIX)/bin/twilight-shell

uninstall:
	for m in $(MODULES); do \
		$(MAKE) -C modules/$$m uninstall PREFIX=$(PREFIX) QMLDIR=$(QMLDIR) DESTDIR=$(DESTDIR); \
	done
	rm -rf $(DESTDIR)$(PREFIX)/share/twilight-shell
	rm -f $(DESTDIR)$(PREFIX)/bin/twilight-shell

.PHONY: install uninstall

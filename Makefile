PREFIX = /usr/local

genl-packet:
	bazel build genl-packet:sniffer
	bazel build genl-packet:generator
	bazel build genl-packet:receive_genl

install: genl-packet
	install -D bazel-bin/genl-packet/sniffer $(DESTDIR)$(PREFIX)/bin/genl-packet-sniffer
	install -D bazel-bin/genl-packet/generator $(DESTDIR)$(PREFIX)/bin/genl-packet-generator 
	install -D genl-packet/sniffer.h $(DESTDIR)$(PREFIX)/bin/genl-packet-dev
	install -D genl-packet/receive_genetlink.h $(DESTDIR)$(PREFIX)/bin/genl-packet-dev
	install -D bazel-bin/genl-packet/libreceive_genl.so $(DESTDIR)$(PREFIX)/bin/genl-packet-so

clean:
	bazel clean --expunge

uninstall:
	-rm -f $(DESTDIR)$(PREFIX)/bin/genl-packet

.PHONY: install clean uninstall genl-packet

# Compatible with GNU make and BSD make.

include config.mk

install:
	@echo Installing to to ${PREFIX}/bin ...
	@mkdir -p ${PREFIX}/bin
	@cp -f bin/0mesnap ${PREFIX}/bin
	@chmod 755 ${PREFIX}/bin/0mesnap
	@cp -f bin/0netsnap ${PREFIX}/bin
	@chmod 755 ${PREFIX}/bin/0netsnap

uninstall:
	@echo Uninstalling from ${PREFIX}/bin ...
	@rm -f ${PREFIX}/bin/0mesnap
	@rm -f ${PREFIX}/bin/0netsnap

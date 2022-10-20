obj-m := kernel_group.o

KDIR ?= /lib/modules/$$(uname -r)/build

all: default

default:
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

.PHONY : clean

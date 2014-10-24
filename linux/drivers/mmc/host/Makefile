# change KERNELDIR var to point to actual kernel sources tree
KERNELDIR=/devel/linux-openrisc-3.4

default:
	$(MAKE) -C ${KERNELDIR} SUBDIRS=$(PWD) modules

clean:
	rm -rf *.o *.ko .*o.cmd *.mod.c .tmp_versions Module.symvers Module.markers modules.order

obj-m 	+= ocsdc.o

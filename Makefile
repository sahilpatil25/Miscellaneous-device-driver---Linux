# To run "make", you can either set up environment variables via
#		source /opt/iot-devkit/1.7.2/environment-setup-i586-poky-linux
# or set up the following make variables
#


CC = i586-poky-linux-gcc
ARCH = x86
CROSS_COMPILE = i586-poky-linux-
SDKTARGETSYSROOT=/opt/iot-devkit/1.7.2/sysroots/i586-poky-linux
export PATH:=/opt/iot-devkit/1.7.2/sysroots/x86_64-pokysdk-linux/usr/bin:/opt/iot-devkit/1.7.2/sysroots/x86_64-pokysdk-linux/usr/bin/i586-poky-linux:$(PATH)
APP = hcsr_tester

obj-m:= HCSR.o

all:
	make ARCH=x86 CROSS_COMPILE=i586-poky-linux- -Wall -C $(SDKTARGETSYSROOT)/usr/src/kernel M=$(PWD) modules
	$(CC) -o $(APP) main.c -Wall -lpthread -g --sysroot=$(SDKTARGETSYSROOT)

clean:
	rm -f *.ko
	rm -f *.o
	rm -f Module.symvers
	rm -f modules.order
	rm -f *.mod
	rm -rf .tmp_versions
	rm -f *.mod.c
	rm -f *.mod.o
	rm -f \.*.cmd
	rm -f Module.markers
	rm -f $(APP) 

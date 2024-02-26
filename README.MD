
# LINUC OS

## PREREQUISITES
Before being able to run the project, you have to install
[QEMU](https://www.qemu.org/docs/master/about/index.html):
> sudo apt install qemu-system-x86

## BUILD 
To build the image run:
> make

in the project root directory.

## RUN
To run the OS run the following command:
> qemu-system-i386 -fda *build/main_floppy.img*

Make sure to give the **path to your image** as argument to the qemu command.

# SyNERGY: An energy measurement and prediction framework for convolutional neural  networks (or ConvNets) on ARM mobile platforms

This framework can be used to provide per-layer energy and performance measurements in a pre-trained Caffe/Caffe2 ConvNet model.

Tested platforms: 
- Jetson TX1: Ubuntu 16.04, Linux kernel: 4.4.38+
- Snapdragon 820: Android 7.0

Tested software frameworks
- Caffe + OpenBLAS backend
- Caffe2 + Eigen backend


Dependencies:
1) ARM Streamline Performance Analyser : https://developer.arm.com/products/software-development-tools/ds-5-development-studio/streamline (Version used: Linux 64-bit 5.28.1)

2) ARM energy probe: 

Note: This is required only for Snapdragon 820 as the Jetson TX1 comes with its on-board power monitoring sensor chip.

Link: https://developer.arm.com/products/software-development-tools/ds-5-development-studio/streamline/arm-energy-probe

This tutorial is split into four phases:
1. Prepare the power measurement equipement: 
 	- Enable INA3221 power sensor chip on the Jetson TX1
	- ARM energy probe for the Snapdragon 820

2. Install ARM streamline tool on host and gator daemon on the host
	- Installing DS-5v5.28.1 for ARM streamline, Eclipse for DS-5
	- Build the gator daemon (gatord). Note: This communicates with the ARM Streamline tool.
		- gator daemon for the TX1 (linux version)
		- gator daemon for the Snapdragon 820 (android version)

3. Integrate ARM Streamline with Caffe/Caffe2
	- ARM Streamline annotations task

4. Take power measurements & calculate per-layer energy
	- Script to read power values from sysfs (or ina3221x@40 entry in the file system )
	


## Part 1: Setting up the power measurement equipment
### Enable INA3221 power sensor chip on the Jetson TX1
This consists mainly of two steps (please refer: https://developer.ridgerun.com/wiki/index.php?title=Compiling_Tegra_X1/X2_source_code)

	I) Cross-compile & flash a modified linux kernel. In this step, we enable a loadable gator module and the INA3221 power sensor chip
		1. Download Jetpack-${version} and run the installation script (I used JetPack 3.1 - L4T 28.1):
			-chmod +x JetPack-${VERSION}.run
			- Run JetPack-${VERSION}.run
		2. Download the kernel sources:
			-./source_sync.sh -k tegra-l4t-r28.1 -u tegra-l4t-r28.1
		3. Download the toolchain and set the appropriate environment variables
			-export CROSS_COMPILE=/opt/linaro/gcc-linaro-5.5.0-2017.10-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
			-export CROSS32CC=/opt/linaro/gcc-linaro-5.5.0-2017.10-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc
			-export ARCH=arm64
		4. Clean your kernel and configuration
			-cd $DEVDIR/64_TX1/Linux_for_Tegra_tx1/sources/kernel_source/
			-make mrproper
		5. Build the gator.ko module
			- Download the gator sources from https://github.com/ARM-software/gator
			- cd /Downloads/Jetpack/64_TX1/Linux_for_tegra/sources/kernel_sources/driver/
			- mkdir gator and  cp -r /path/to/gator/driver-src/* gator
			- We have to edit Makefile and Kconfig file in kernel_sources/drivers. Edit Makefile in the kernel drivers folder and add obj-$(CONFIG_GATOR) += gator/ to the end 

			- Edit Kconfig in the kernel drivers folder and add source "drivers/gator/Kconfig" before the last endmenu.
		6. Configure your kernel
			- sudo apt-get install libncurses-dev (This is required only once)
			- make menuconfig & enable CONFIG_SENSORS_INA3221=y and CONFIG_GATOR=m (Refer:  https://github.com/ARM-software/gator for further details on kernel configurations required)
		7. Compile kernel, device tree and modules
			- make zImage
			- make dtbs
			- make modules (This will create gator.ko file check kernel_sources/drivers/gator for this file)
		8. Follow steps 5- 11 in https://developer.ridgerun.com/wiki/index.php?title=Compiling_Tegra_X1/X2_source_code to make the new sources suitable for Jetpack and flash the new modified kernel.
		
		
	II) Modify the device tree to enable the ina3221x@40 entry
		On the target Jetson TX1, in /boot/extlinux/extlinux.conf you will see configuration data for booting the board you will see it mention /boot/tegra210-jetson-tx1-p2597-2180-a01-devkit.dtb this is the dtb being used. 
		On your host pc:
			- sudo apt-get install device-tree-compiler
			- copy /boot/tegra210-jetson-tx1-p2597-2180-a01-devkit.dtb to your host PC then
			- dtc -I dtb -O dts -o tegra210-jetson-tx1-p2597-2180-a01-devkit.dts tegra210-jetson-tx1-p2597-2180-a01-devkit.dtb
			- enable 1-0040 status = "okay"
			- Convert it back to dtb (dtc -I dts -O dtb -o tegra210-jetson-tx1-p2597-2180-a01-devkit.dtb tegra210-jetson-tx1-p2597-2180-a01-devkit.dts) and transfer to /boot


## Part 2: Install ARM streamline tool on host and gator daemon on the host
### Installing DS-5v5.28.1 for ARM streamline, Eclipse for DS-5

### Build the gator daemon (gatord). Note: This communicates with the ARM Streamline tool.
#### gator daemon for the TX1 (linux version)
#### gator daemon for the Snapdragon 820 (android version)


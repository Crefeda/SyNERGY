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

	2) ARM energy probe: (Required only for Snapdragon 820 as the Jetson TX1 comes with its on-board power monitoring sensor chip)
Link: https://developer.arm.com/products/software-development-tools/ds-5-development-studio/streamline/arm-energy-probe

This tutorial is split into four phases:
1. Prepare the power measurement equipement: 
 	- Enable INA3221 power sensor chip on the TX1
	- ARM energy probe for the Snapdragon 820

2. Install ARM streamline tool on host and gator daemon on the host
	- Installing DS-5v5.28.1 for ARM streamline, Eclipse for DS-5
	- Build the gator daemon (This communicates with the ARM Streamline tool)

3. Integrate ARM Streamline with Caffe/Caffe2
	- ARM Streamline annotations task

4. Take power measurements & calculate per-layer energy
	- Script to read power values from sysfs (or ina3221x@40 entry in the file system )


## Part 1: Setting up power measurement equipment
### Jetson TX1: Power sensor chip
This consists mainly of two steps:

	- Cross-compile & flash a modified linux kernel to enable a loadable gator module and enable the INA3221 power sensor chip

	- Build the gator module

	- Modify the device tree to enable the ina3221x@40 entry 

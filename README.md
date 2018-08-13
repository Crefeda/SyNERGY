# SyNERGY: An energy measurement and prediction framework for convolutional neural  networks (or ConvNets) on ARM mobile platforms

This framework can be used to provide per-layer energy and performance measurements in a pre-trained Caffe/Caffe2 ConvNet model.

Tested platforms: 
- Jetson TX1: Ubuntu 16.04, Linux kernel: 4.4.38+
- Snapdragon 820: Android 7.0

Tested software frameworks
- Caffe + OpenBLAS backend
- Caffe2 + Eigen backend


Dependencies:
ARM Streamline Performance Analyser : https://developer.arm.com/products/software-development-tools/ds-5-development-studio/streamline
Version used: Linux 64-bit 5.28.1

- ARM energy probe: (Required only for Snapdragon 820 as the Jetson TX1 comes with its on-board power monitoring sensor chip) : https://developer.arm.com/products/software-development-tools/ds-5-development-studio/streamline/arm-energy-probe

This tutorial is split into four phases:
1. Set up the power measurement equipement: 
 - Power sensor on the TX1
 - ARM energy probe for the snapdragon
2. Set up ARM streamline on host platform
3. Integrate ARM Streamline with Caffe/Caffe2
4. Take power measurements & calculate per-layer energy


## Part 1: Setting up power measurement equipment
### Jetson TX1: Power sensor chip

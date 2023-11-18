#!/bin/bash

# initialises the yocto project for the zuboard 1cg
# velho@2023

# get dependencies for ubuntu
lsb_release=/etc/lsb-release
if [[ -d $lsb_release ]]; then
    if grep -q "Ubuntu" $lsb_release; then
        sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1
        sudo locale-gen en_US.UTF-8
    fi
fi
# initializes submodules
git submodule update --init --recursive

# create symlinks from meta-xilinx, core and bsp

if [[ ! -d ./meta-xilinx-core ]]; then
    ln -s ./meta-xilinx/meta-xilinx-core ./meta-xilinx-core
fi

if [[ ! -d ./meta-xilinx-bsp ]]; then
    ln -s ./meta-xilinx/meta-xilinx-bsp ./meta-xilinx-bsp
fi

# initialize yocto env
. ./poky/oe-init-build-env build

# add meta-xilinx-core and meta-xilinx-bsp as layers
# exclude if already exists in bblayers.conf

if ! grep -q "meta-xilinx-core" conf/bblayers.conf; then
    bitbake-layers add-layer ../meta-xilinx-core
fi

if ! grep -q "meta-xilinx-bsp" conf/bblayers.conf; then
    bitbake-layers add-layer ../meta-xilinx-bsp
fi



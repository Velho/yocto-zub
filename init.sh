#!/bin/bash

# initialises the yocto project for the zuboard 1cg
# velho@2023

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



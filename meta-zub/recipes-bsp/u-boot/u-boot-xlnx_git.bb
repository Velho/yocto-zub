# Recipe created by recipetool
# This is the basis of a recipe and may need further editing in order to be fully functional.
# (Feel free to remove these comments when editing.)

# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
# your responsibility to verify that the values are complete and correct.
#
# The following license files were not able to be identified and are
# represented as "Unknown" below, you will need to check them yourself:
#   cmd/license.c
#   fs/jffs2/LICENCE
#   lib/lzma/license.txt
LICENSE = "Unknown"
LIC_FILES_CHKSUM = "file://cmd/license.c;md5=f507e0b435db3cb8b08a3f54705121c1 \
                    file://fs/jffs2/LICENCE;md5=fcd40f6cb09221b0782c1d09ba266911 \
                    file://lib/lzma/license.txt;md5=8ecc4f7ef807bbf661bf65387dc7cd08"

SRC_URI = "git://github.com/Xilinx/u-boot-xlnx.git;protocol=https;branch=master"

# Modify these as desired
PV = "1.0+git${SRCPV}"
SRCREV = "50f4accf971fe2708a4b4fd515bb5542c50e7f5d"

S = "${WORKDIR}/git"

inherit module

EXTRA_OEMAKE:append:task-install = " -C ${STAGING_KERNEL_DIR} M=${S}"
# Unable to find means of passing kernel path into install makefile - if kernel path is hardcoded you will need to patch the makefile. Note that the variable KERNEL_SRC will be passed in as the kernel source path.

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

IMX_FIRMWARE_SRC ?= "git://github.com/NXP/imx-firmware.git;protocol=https"

SRCBRANCH_imx-firmware = "lf-6.1.22_2.0.0"
SRC_URI += " \
    ${IMX_FIRMWARE_SRC};branch=${SRCBRANCH_imx-firmware};destsuffix=imx-firmware;name=imx-firmware \
"

SRCREV_imx-firmware = "f775d53ca3a478c85e8c8a880e44cc269bd14db0"

# add NXP 88W9098 firmware
do_install:append () {    
    # Install NXP Connectivity 9098 firmware
    install -d ${D}${nonarch_base_libdir}/firmware/nxp
    install -m 0644 ${WORKDIR}/imx-firmware/nxp/wifi_mod_para.conf                     ${D}${nonarch_base_libdir}/firmware/nxp
    install -m 0644 ${WORKDIR}/imx-firmware/nxp/FwImage_9098_SD/sdiouart9098_combo_v1.bin ${D}${nonarch_base_libdir}/firmware/nxp
}

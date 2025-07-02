SUMMARY = "jody-w3"
DESCRIPTION = "jody-w3"
SECTION = "examples"
PR = "r0"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://jody-w3.conf \
"

S = "${WORKDIR}"

do_install:append () {
    install -d ${D}/etc/modprobe.d
    install -m 0755 ${S}/jody-w3.conf ${D}/etc/modprobe.d
}

FILES:${PN} += "/etc/modprobe.d"

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SLOT="0"
ETYPE="sources"

CKV=`date +%F`
K_SECURITY_UNSUPPORTED="1"

inherit kernel-2 git-2
detect_version

K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"

EGIT_REPO_URI="git://github.com/raspberrypi/linux.git"
EGIT_BRANCH="rpi-3.8.y"
EGIT_PROJECT="${P}"

DESCRIPTION="Full sources for the Linux kernel including the Raspberry Pi
patches"
HOMEPAGE="https://github.com/raspberrypi/linux"

KEYWORDS="~arm"
IUSE="deblob minimal"

pkg_setup(){
	if use minimal; then
		EGIT_OPTIONS="--depth 1"
	fi

	kernel-2_pkg_setup
}

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/raspberrypi-userland/raspberrypi-userland-9999.ebuild,v 1.1 2013/02/02 00:57:27 chithanh Exp $

EAPI=5

inherit flag-o-matic toolchain-funcs cmake-utils git-2

DESCRIPTION="Raspberry Pi userspace tools and libraries"
HOMEPAGE="https://github.com/raspberrypi/userland"
EGIT_REPO_URI="git://github.com/raspberrypi/userland.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~arm"
IUSE="debug examples"

src_prepare() {
	# init script for Debian, not useful on Gentoo
	sed -i "/DESTINATION \/etc\/init.d/,+2d" interface/vmcs_host/linux/vcfiled/CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs="
		-DCMAKE_TOOLCHAIN_FILE=${FILESDIR}/toolchain.cmake"

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	# Drop examples
	use examples || rm -r ${ED}/opt/vc/src

	doenvd "${FILESDIR}"/04${PN}
}

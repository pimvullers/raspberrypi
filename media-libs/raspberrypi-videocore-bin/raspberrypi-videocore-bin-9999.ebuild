# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="Raspberry PI precompiled userspace VideoCoreIV"
HOMEPAGE="https://github.com/raspberrypi/firmware"
EGIT_REPO_URI="git://github.com/raspberrypi/firmware.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~arm -*"
IUSE="+hardfp"

src_prepare() {
	hardfp="."
	use hardfp && hardfp+="/hardfp"

	# Drop example sources
	rm -r "${hardfp}/opt/vc/src" || die

	# Move the license file
	mv "${hardfp}/opt/vc/LICENCE" ./LICENSE || die
}

src_install() {
	mv "${hardfp}/opt" "${ED}" || die

	doenvd "${FILESDIR}/04${PN}"
	dodoc ./LICENSE
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit flag-o-matic

DESCRIPTION="User utilities for zisofs"
HOMEPAGE="https://www.kernel.org/pub/linux/utils/fs/zisofs/"
SRC_URI="mirror://kernel/linux/utils/fs/zisofs/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE="static"

RDEPEND=">=sys-libs/zlib-1.1.4"
DEPEND="${RDEPEND}"

src_configure() {
	use static && append-ldflags -static
	default
}

src_install() {
	emake INSTALLROOT="${D}" install
	dodoc CHANGES INSTALL README
}

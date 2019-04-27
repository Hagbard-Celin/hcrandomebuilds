# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3


DESCRIPTION="Corsair AXi Series PSU monitoring application "
HOMEPAGE="https://github.com/ka87/cpsumon"
SRC_URI=""
EGIT_REPO_URI="https://github.com/Hagbard-Celin/cpsumon.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


src_prepare() {
		default
        cmake-utils_src_prepare
}


#src_install() {
#        newbin "${WORKDIR}/cpsumon-9999_build/cpsumoncli"  cpsumoncli
#		newlib.so "${WORKDIR}/cpsumon-9999_build/libcpsumon/libcpsumon.so"  libcpsumon.so
#}


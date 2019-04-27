# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6


inherit autotools cmake-utils

DESCRIPTION="LightDM greeter previously known as lxqt-lightdm-greeter"
HOMEPAGE="https://github.com/surlykke/qt-lightdm-greeter"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	SRC_URI=""
	KEYWORDS="amd64"
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
	S="${WORKDIR}/${PN//lightdm-}-${PV}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	x11-misc/lightdm-qt5
"
RDEPEND="${DEPEND}
	dev-util/cmake"


src_prepare(){
	cmake-utils_src_prepare
}

src_configure(){
    cmake-utils_src_configure
}

src_compile(){
    cmake-utils_src_compile
	}

src_install(){
    cmake-utils_src_install
	}


pkg_postinst(){
	einfo "To enable the slick-greeter support, set the greeter-session option"
	einfo "to 'qg-lightdm-greeter' in your lightdm.conf in order to get this:"
	einfo "greeter-session=qt-lightdm-greeter"
	einfo "then, restart your session and the lightdm/xdm daemon."
}


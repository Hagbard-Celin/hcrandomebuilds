# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_6 )

inherit python-single-r1

DESCRIPTION="A set of profiles for the GNU Screen console window manager (app-misc/screen)"
HOMEPAGE="http://byobu.co"
if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dustinkirkland/${PN}.git"
else
	SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${P/-/_}.orig.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="screen"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-libs/newt[${PYTHON_USEDEP}]
	screen? ( app-misc/screen )
	!screen? ( app-misc/tmux )"

src_prepare() {
	default
	[[ ${PV} == "9999" ]] && { ./autogen.sh || die; }

	python_fix_shebang .

	# Set default system backend to screen
	if use screen ; then
		sed -i -e 's/#\(BYOBU_BACKEND\).*/\1="screen"/' etc/byobu/backend || die
	fi
}

src_install() {
	default

	# Create symlinks for backends
	dosym ${PN} /usr/bin/${PN}-screen
	dosym ${PN} /usr/bin/${PN}-tmux

	docompress -x /usr/share/doc/${PN}
}

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3

DESCRIPTION="Opensource implementation of VBAN audio over UDP protocol by VB-Audio"
HOMEPAGE="https://github.com/quiniouben/vban"
SRC_URI=""
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="alsaSetParamsRework"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="alsa jack -pulseaudio"

DEPEND="
	alsa? ( media-libs/alsa-lib )
	jack? ( virtual/jack )
	pulseaudio? ( media-sound/pulseaudio )"
RDEPEND="${DEPEND}"

src_prepare() {
    eautoreconf
    eapply_user
}

src_configure(){
	econf \
		$(use_enable alsa ) \
		$(use_enable jack ) \
		$(use_enable pulseaudio )
}


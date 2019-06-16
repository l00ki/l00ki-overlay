# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 xdg

DESCRIPTION="A GTK-based frontend for net-p2p/syncthing"
HOMEPAGE="https://github.com/syncthing/syncthing-gtk"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/syncthing/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/syncthing/${PN}/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	dev-python/pygobject
	dev-python/python-dateutil
	dev-python/bcrypt
	dev-python/setuptools
	sys-process/psmisc
	net-p2p/syncthing
"

python_install_all() {
	local DOCS=( README.md )
	distutils-r1_python_install_all
}

pkg_preinst() {
	xdg_pkg_preinst
}

pkg_postinst() {
	xdg_pkg_postinst
}

pkg_postrm() {
	xdg_pkg_postrm
}

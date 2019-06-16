# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6,3_7} )

inherit distutils-r1 xdg

DESCRIPTION="A userspace driver for the Sony DualShock 4 game controller on Linux"
HOMEPAGE="https://github.com/chrippa/ds4drv"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/chrippa/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/chrippa/${PN}/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-python/setuptools
	net-wireless/bluez
	dev-python/pyudev
	dev-python/python-evdev
"

python_install_all() {
	local DOCS=( README.rst )
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

TERMUX_PKG_HOMEPAGE=https://github.com/dundee/gdu
TERMUX_PKG_DESCRIPTION="Modern and intuitive terminal-based text editor"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="5.17.0"
TERMUX_PKG_SRCURL=https://github.com/dundee/gdu/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=918a92b6819c0de55154013813f5f989e222d63285eb203970df9869cd1571dc
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	return
}

termux_step_make_install() {
	termux_setup_golang

	make build
	install -D dist/gdu -t $TERMUX_PREFIX/bin
	make gdu.1
	install -Dm644 gdu.1 -t $TERMUX_PREFIX/share/man/man1
}

# Maintainer: Naoya Inada <naoina@kuune.org>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

# NOTE: This PKGBUILD is based on https://osdn.net/downloads/users/26/26669/mozcdic-ut-20200924.1.PKGBUILD/

## Mozc compile option
_bldtype=Release

_mozcver=2.23.2815.102
_fcitxver=2.23.2815.102.1
_utdicdate=20200924
pkgver=${_mozcver}.${_utdicdate}
pkgrel=1

pkgname=mozc-ut
arch=('i686' 'x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
makedepends=('clang' 'gyp' 'ninja' 'pkg-config' 'python' 'curl' 'gtk2' 'qt5-base' 'zinnia' 'fcitx' 'libxcb' 'glib2' 'bzip2' 'unzip')

source=(
  http://ftp.jp.debian.org/debian/pool/main/m/mozc/mozc_${_mozcver}+dfsg.orig.tar.xz
  protobuf-3.5.2.tar.gz::https://github.com/protocolbuffers/protobuf/archive/v3.5.2.tar.gz
  https://salsa.debian.org/debian/mozc/-/raw/master/debian/patches/usage_dict.txt.patch
  https://salsa.debian.org/debian/mozc/-/raw/master/debian/patches/Fix-build-with-gcc8.patch
  https://salsa.debian.org/debian/mozc/-/raw/master/debian/patches/Change-from-python2-code-to-python3.patch
  https://salsa.debian.org/debian/mozc/-/raw/master/debian/patches/add_support_new_japanese_era.patch
  "mozcdic-ut-${_utdicdate}.${pkgrel}.tar.bz2::https://osdn.net/frs/chamber_redir.php?m=ymu&f=%2Fusers%2F26%2F26672%2Fmozcdic-ut-${_utdicdate}.${pkgrel}.tar.bz2"
)

sha1sums=(
  '7e0a39ffd5ea68ecadb792fc521c16b5be1f25cb'
  'd0c551031828ed9c07cc683762353a67b1a17627'
  'c6f5aac79c7e98fbda96de251d8f0d0787344ca9'
  '4fe935b5c2d316119cf8957b6518b3b5e7bf6ecf'
  'SKIP'
  '13f8fbbc768d5042fb55d877acf2a73fc8b5e3f0'
  'SKIP'
)

prepare() {
  cd mozc-${_mozcver}+dfsg
  mkdir -p src/third_party
  mv ${srcdir}/protobuf-3.5.2 src/third_party/protobuf
  patch -Np1 -i ${srcdir}/usage_dict.txt.patch
  patch -Np1 -i ${srcdir}/Fix-build-with-gcc8.patch
  patch -Np1 -i ${srcdir}/Change-from-python2-code-to-python3.patch
  patch -Np1 -i ${srcdir}/add_support_new_japanese_era.patch

  # Avoid fcitx5 build errors
  rm -rf src/unix/fcitx5/

  # Add UT dictionary
  cat ${srcdir}/mozcdic-ut-${_utdicdate}.${pkgrel}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt
}

build() {
  cd mozc-${_mozcver}+dfsg/src

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool renderer/renderer.gyp:mozc_renderer"

  GYP_DEFINES="use_libzinnia=1 document_dir=/usr/share/licenses/mozc" python build_mozc.py gyp --gypdir=/usr/bin --target_platform=Linux
  python build_mozc.py build -c $_bldtype $_targets
}

package_mozc-ut() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input) with Mozc UT Dictionary (additional dictionary)"
  arch=('i686' 'x86_64')
  depends=('qt5-base' 'zinnia')
  conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut2' 'mozc-ut2' 'fcitx-mozc-neologd-ut' 'mozc-neologd-ut' 'fcitx-mozc-ut-unified' 'mozc-ut-unified')
  cd mozc-${_mozcver}+dfsg/src
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install -m 755 out_linux/${_bldtype}/mozc_tool "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 ../LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_fcitx-mozc-ut() {
  pkgdesc="Fcitx engine module for Mozc with Mozc UT Dictionary"
  arch=('i686' 'x86_64')
  depends=("mozc-ut=${pkgver}" 'fcitx')
  conflicts=('fcitx-mozc' 'fcitx-mozc-ut2' 'fcitx-mozc-neologd-ut' 'fcitx-mozc-ut-unified')

  cd mozc-${_mozcver}+dfsg/src
  for mofile in out_linux/${_bldtype}/gen/unix/fcitx/po/*.mo
  do
    filename=`basename $mofile`
    lang=${filename/.mo/}
    install -D -m 644 "$mofile" "${pkgdir}/usr/share/locale/$lang/LC_MESSAGES/fcitx-mozc.mo"
  done

  install -D -m 755 out_linux/${_bldtype}/fcitx-mozc.so "${pkgdir}/usr/lib/fcitx/fcitx-mozc.so"
  install -D -m 644 unix/fcitx/fcitx-mozc.conf "${pkgdir}/usr/share/fcitx/addon/fcitx-mozc.conf"
  install -D -m 644 unix/fcitx/mozc.conf "${pkgdir}/usr/share/fcitx/inputmethod/mozc.conf"

  install -d ${pkgdir}/usr/share/fcitx/mozc/icon
  install -m 644 ${srcdir}/fcitx-mozc-icons/*.png ${pkgdir}/usr/share/fcitx/mozc/icon/
}

# Maintainer: ChemistMikeLam <43129403+ChemistMikeLam at users dot noreply dot github dot com>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

#NOTE: The UT dictionary's project page: http://linuxplayers.g1.xrea.com/mozc-ut.html

ENABLED_DICTIONARIES=(
'alt-cannadic'
'edict2'
'jawiki'
'neologd'
'personal-names'
'place-names'
'skk-jisyo'
'sudachidict'
)

_pkgverbase=2.30.5448.102
_upstreamdate=20240426
_wikidate=20240420
pkgname='ibus-mozc-ut'
pkgver=${_pkgverbase}.u${_upstreamdate}.w${_wikidate}
pkgrel=3
pkgdesc='The Open Source edition of Google Japanese Input bundled with the UT dictionary with IBus integration'
arch=('x86_64')
url='https://github.com/google/mozc'
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND CC0-1.0 AND CC-BY-SA-3.0 AND CC-BY-SA-4.0 AND GPL-2.0-only AND GPL-2.0-or-later AND MIT AND NAIST-2003 AND Unicode-3.0 AND LicenseRef-Okinawa-Dictionary')
depends=('qt6-base')
makedepends=('bazel' 'git' 'python' 'rsync' 'ruby' 'wget')
provides=("mozc=${_pkgverbase}" "ibus-mozc=${_pkgverbase}")
conflicts=('mozc' 'mozc-ut' 'ibus-mozc')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=c50bd32a0931d558797d71cfc11091ee17c55ac1"
        'git+https://github.com/utuhiro78/merge-ut-dictionaries.git#commit=7d8a3f9df79e4bf38ab973a64dbc2cd562f2306e'
        'git+https://github.com/utuhiro78/mozcdic-ut-alt-cannadic.git#commit=4e548e6356b874c76e8db438bf4d8a0b452f2435'
        'git+https://github.com/utuhiro78/mozcdic-ut-edict2.git#commit=4a08ebf0397c65991b5f6d7f4dd2cbc583a12c83'
        'git+https://github.com/utuhiro78/mozcdic-ut-jawiki.git#commit=42297bc4e14cf1e2f244df996a5bbd1782e3a189'
        'git+https://github.com/utuhiro78/mozcdic-ut-neologd.git#commit=b0de4b90d7ddc3b837b40dc6974d6467daedc491'
        'git+https://github.com/utuhiro78/mozcdic-ut-personal-names.git#commit=adaaaf903f9609a52cafc63aea7a58fc6e00cc64'
        'git+https://github.com/utuhiro78/mozcdic-ut-place-names.git#commit=2dfabeab535c90308e0d25bdd9b95de90cfc904e'
        'git+https://github.com/utuhiro78/mozcdic-ut-skk-jisyo.git#commit=5a996bfd369ee44ec681f86bb7880904e9171cdd'
        'git+https://github.com/utuhiro78/mozcdic-ut-sudachidict.git#commit=c109f062a6c80e52be4b96adbf4123404b2048d1'
        "https://dumps.wikimedia.org/jawiki/${_wikidate}/jawiki-${_wikidate}-all-titles-in-ns0.gz")
noextract=("jawiki-${_wikidate}-all-titles-in-ns0.gz")
sha256sums=('f1f7bb38dce2fae8884bd26a6b26a838128d244bf98faae18f43b789da04ff2e'
            '3ecd05af2f57e6c803e0798fa74a36580d541229e28b5d15f446b12ec367c9e4'
            '89317143e6396f2f8b4265a932c7f3607f55210854a3f5ccb9b265c1d222f6ed'
            'e20c9d7b490a8c71b9d974ab4bc56e031493388e53fe959dd1da0373aaef84dc'
            'fb4da8ef71932b5b95952b82e0be16bac71f04ffba038020ff07f8e5b0c9b499'
            'b3aeb18f86c0692021cc525a92c02ec5483bc507873817632883842d63588c36'
            '0710c34a781d3f677ec944f9a6a456b89bd2f0d3906aa072ceaeee3db0bce1f0'
            '6144ac853ed47a9a2f8022887253c0ff1883b3a5b9470396b2ce84dbf2c91c59'
            '7ef9d90e6dd00af84fa5e14026fda54bbaa1c30fb03dfed2365c4043292bb39a'
            'bbe04bc6b9768b1c167788cb417aefad9f0a1ac60a63ea5a2bfd2056b7aa32c2'
            '6e9d3553b776e26b1ba5ba7f51bbeeeb1b0540e335f9bd08b2e01d805d28a5b7')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive

    cd "${srcdir}"/merge-ut-dictionaries/src/

    # Use our local copy of the Mozc repo
    sed -i -e "s|https://raw.githubusercontent.com/google/mozc/master/src|${srcdir}/${pkgname}-git/src|" remove_duplicate_ut_entries.rb

    # Use a dated snapshot for the JAWiki dump data
    sed -i -e '/wget/d' count_word_hits.rb
    sed -i -e "s|filename = \"jawiki-|filename = \"${srcdir}/jawiki-|g" count_word_hits.rb
    sed -i -e "s|jawiki-[a-z0-9]\{6,8\}|jawiki-${_wikidate}|g" count_word_hits.rb apply_word_hits.rb

    # Compile the UT dictionary
    printf '\nCompiling the UT dictionary...\n\n'

    [[ -e mozcdic-ut.txt ]] && rm mozcdic-ut.txt

    for dict in "${ENABLED_DICTIONARIES[@]}"
    do
        tar -xf "${srcdir}"/mozcdic-ut-${dict}/mozcdic-ut-${dict}.txt.tar.bz2
        cat mozcdic-ut-${dict}.txt >> mozcdic-ut.txt
    done

    ruby remove_duplicate_ut_entries.rb mozcdic-ut.txt
    ruby count_word_hits.rb
    ruby apply_word_hits.rb mozcdic-ut.txt

    # Append the UT dictionary
    cat mozcdic-ut.txt >> "${srcdir}"/${pkgname}-git/src/data/dictionary_oss/dictionary00.txt
}

build() {
    cd ${pkgname}-git/src

    unset ANDROID_NDK_HOME
    unset ANDROID_HOME
    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'

    # Temp fix for GCC 14
    sed -i -e '/Werror/d' third_party/protobuf/build_defs/cpp_opts.bzl

    bazel build server:mozc_server gui/tool:mozc_tool renderer/qt:mozc_renderer unix/ibus:ibus_mozc unix/icons --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    # BSD-3-Clause
    sed -n 67,94p data/installer/credits_en.html > Mozc
    install -Dm644 Mozc "${pkgdir}"/usr/share/licenses/${pkgname}/Mozc
    # BSD-3-Clause
    sed -n 317,344p data/installer/credits_en.html > Breakpad
    install -Dm644 Breakpad "${pkgdir}"/usr/share/licenses/${pkgname}/Breakpad
    # NAIST-2003
    sed -n 355,424p data/installer/credits_en.html > IPAdic
    install -Dm644 IPAdic "${pkgdir}"/usr/share/licenses/${pkgname}/IPAdic
    # BSD-2-Clause
    sed -n 435,457p data/installer/credits_en.html > Japanese-Usage-Dictionary
    install -Dm644 Japanese-Usage-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Japanese-Usage-Dictionary
    # Public Domain Data
    sed -n 468,470p data/installer/credits_en.html > Okinawa-Dictionary
    install -Dm644 Okinawa-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Okinawa-Dictionary
    # BSD-3-Clause
    sed -n 481,513p data/installer/credits_en.html > Protocol-Buffers
    install -Dm644 Protocol-Buffers "${pkgdir}"/usr/share/licenses/${pkgname}/Protocol-Buffers
    # MIT
    sed -n 698,704p data/installer/credits_en.html > Tamachi-Phonetic-Kanji-Alphabet
    install -Dm644 Tamachi-Phonetic-Kanji-Alphabet "${pkgdir}"/usr/share/licenses/${pkgname}/Tamachi-Phonetic-Kanji-Alphabet
    # MIT
    sed -n 762,782p data/installer/credits_en.html > Windows-Implementation-Library
    sed -i -e 's|^[ \t]*||g' Windows-Implementation-Library
    install -Dm644 Windows-Implementation-Library "${pkgdir}"/usr/share/licenses/${pkgname}/Windows-Implementation-Library

    install -Dm755 bazel-bin/server/mozc_server "${pkgdir}"/usr/lib/mozc/mozc_server
    install -Dm755 bazel-bin/gui/tool/mozc_tool "${pkgdir}"/usr/lib/mozc/mozc_tool

    install -Dm755 bazel-bin/renderer/qt/mozc_renderer "${pkgdir}"/usr/lib/mozc/mozc_renderer

    install -Dm755 bazel-bin/unix/ibus/ibus_mozc "${pkgdir}"/usr/lib/ibus-mozc/ibus-engine-mozc
    install -Dm644 bazel-bin/unix/ibus/mozc.xml "${pkgdir}"/usr/share/ibus/component/mozc.xml

    cd bazel-bin/unix

    unzip -o icons.zip

    install -Dm644 mozc.png                         "${pkgdir}"/usr/share/ibus-mozc/product_icon.png
    install -Dm644 alpha_full.svg                   "${pkgdir}"/usr/share/ibus-mozc/alpha_full.svg
    install -Dm644 alpha_half.svg                   "${pkgdir}"/usr/share/ibus-mozc/alpha_half.svg
    install -Dm644 direct.svg                       "${pkgdir}"/usr/share/ibus-mozc/direct.svg
    install -Dm644 hiragana.svg                     "${pkgdir}"/usr/share/ibus-mozc/hiragana.svg
    install -Dm644 katakana_full.svg                "${pkgdir}"/usr/share/ibus-mozc/katakana_full.svg
    install -Dm644 katakana_half.svg                "${pkgdir}"/usr/share/ibus-mozc/katakana_half.svg
    install -Dm644 outlined/dictionary.svg          "${pkgdir}"/usr/share/ibus-mozc/dictionary.svg
    install -Dm644 outlined/properties.svg          "${pkgdir}"/usr/share/ibus-mozc/properties.svg
    install -Dm644 outlined/tool.svg                "${pkgdir}"/usr/share/ibus-mozc/tool.svg
}

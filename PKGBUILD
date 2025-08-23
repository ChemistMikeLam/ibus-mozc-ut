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

_pkgverbase=2.31.5851.102
_upstreamdate=20250602
_wikidate=20250820
pkgname='ibus-mozc-ut'
pkgver=${_pkgverbase}.u${_upstreamdate}.w${_wikidate}
pkgrel=1
pkgdesc='The Open Source edition of Google Japanese Input bundled with the UT dictionary with IBus integration'
arch=('x86_64')
url='https://github.com/google/mozc'
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND CC0-1.0 AND CC-BY-SA-3.0 AND CC-BY-SA-4.0 AND GPL-2.0-only AND GPL-2.0-or-later AND MIT AND NAIST-2003 AND Unicode-3.0 AND LicenseRef-Okinawa-Dictionary')
depends=('qt6-base')
makedepends=('bazel' 'git' 'python' 'qt6-base')
provides=("mozc=${_pkgverbase}" "ibus-mozc=${_pkgverbase}")
conflicts=('mozc' 'mozc-ut' 'ibus-mozc')
options=(!distcc !ccache)
source=('git+https://github.com/google/mozc.git#commit=d703e617246b3916edcb5b95812badef1a2764bc'
        'git+https://github.com/abseil/abseil-cpp.git#commit=4447c7562e3bc702ade25105912dce503f0c4010'
        'git+https://github.com/google/breakpad.git#commit=216cea7bca53fa441a3ee0d0f5fd339a3a894224'
        'git+https://github.com/google/googletest.git#commit=b514bdc898e2951020cbdca1304b75f5950d1f59'
        'git+https://github.com/chromium/gyp.git#commit=9ecf45e37677743503342ee4c6a76eaee80e4a7f'
        'git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=e5b3425575734c323e1d947009dd74709437b684'
        'git+https://github.com/protocolbuffers/protobuf.git#commit=7cc670c1809e704ebeba90fb430d50e009f36727'
        'git+https://github.com/microsoft/wil.git#commit=fc5dbf55989fe20351c71d038a8d12de4b397a6d'
        'git+https://github.com/utuhiro78/merge-ut-dictionaries.git#commit=3e6d04df2efd9303caf7c6a7489749a392c52e73'
        'git+https://github.com/utuhiro78/mozcdic-ut-alt-cannadic.git#commit=bf26bcbb1846f2e9cf35cbfcafcc91c015a1fb22'
        'git+https://github.com/utuhiro78/mozcdic-ut-edict2.git#commit=b43932b90dc5f9788383b708cb117f06d16df521'
        'git+https://github.com/utuhiro78/mozcdic-ut-jawiki.git#commit=1f79374f1b5b83f143f3328091794dfa369271ef'
        'git+https://github.com/utuhiro78/mozcdic-ut-neologd.git#commit=e33ac4ce808fa4253c6c97bf5178e229a4bfb50f'
        'git+https://github.com/utuhiro78/mozcdic-ut-personal-names.git#commit=f9e05d2e06fc30137e4dadaf22966e6616442710'
        'git+https://github.com/utuhiro78/mozcdic-ut-place-names.git#commit=2d942f3f30ebe6fcab5e92ca0bd76a531c87c33f'
        'git+https://github.com/utuhiro78/mozcdic-ut-skk-jisyo.git#commit=384ad926e306d5308839c6dedb63696f11703968'
        'git+https://github.com/utuhiro78/mozcdic-ut-sudachidict.git#commit=d1afebf15d8d63be62c2df2aceaf42cb1c243acd'
        "https://dumps.wikimedia.org/jawiki/${_wikidate}/jawiki-${_wikidate}-pages-articles-multistream-index.txt.bz2")
noextract=("jawiki-${_wikidate}-pages-articles-multistream-index.txt.bz2")
sha256sums=('8b5ec72c5a12feeaa96bf87be35d9e96986938cc71305e5f9e539c919f2873ea'
            'e131bbdd4e207d6cc2930bca9db82d6da9e347175c1125d9d1f2e09a36652278'
            '5168bb8ea19e2f696eeecbdee991f28e496aea206a473fd7cb49b547f5d0c5af'
            'c081295f2c22705e07fc430e152a30b36f949a179075d47d3e12ff3109d43c6a'
            '8a136786407526c64686c3f9990d6416d62c7e2d474ef4a75ced337ecfc58cef'
            '10a13d356071f2b0c2b6dcab1d841fae451f6a2020ee9b901533533fc7ac3008'
            '578ead09a4a3fbf2f70b6af56e0b385ca136c79a4f4a62c777cb13e7a6f733f5'
            'abb86ac4d546c98d7d9a10fdeb1059d6e3395e892d5397fb03179361f37c98fe'
            '862da24719ef04346d57f99fa7c0a37b0fe246378cf30cb4a8def24aa12a1155'
            '81ed16f6b59f64e08482ea7ab676913584d95ecac00255e981374f02df2188e9'
            '5e276fa4fe063852ae54d18fc8adcb068c1f1b725b51cb3255f429439cc7ca9f'
            'ca6d56ca8ae41a71ecffa2958f8d36349f869dc479f87f43a5b41569eb6c4736'
            '2bb007c54db6bb70d1771bffaeb05217c0e768cb176b9343ec0a25e9756d9f67'
            '2fa1dfeab0bc5a13ab1062b8257521d0102530093ad8ac6b5ca77d34ae3e3069'
            'b6fc7068995ece29cf585f5c23c471f5f364e24516ac92b44defdc5ef987754c'
            'bf1960c14d821a01a9717bbd22b3321844514796c59e6eae84afbb18c295f9c3'
            '18e64d1ef7a7589765b2d35eb4b4d05cc50251ccebc67c7d8a8042f30757cca9'
            'c66377f1ed9569f96e5e93fff6acbd71749b2f9979695ffb5c9772e651b7b564')

prepare() {
    cd mozc/src

    git submodule init
    git config submodule.src/third_party/abseil-cpp.url "${srcdir}/abseil-cpp"
    git config submodule.src/third_party/breakpad.url "${srcdir}/breakpad"
    git config submodule.src/third_party/gtest.url "${srcdir}/googletest"
    git config submodule.src/third_party/gyp.url "${srcdir}/gyp"
    git config submodule.src/third_party/japanese_usage_dictionary.url "${srcdir}/japanese-usage-dictionary"
    git config submodule.src/third_party/protobuf.url "${srcdir}/protobuf"
    git config submodule.src/third_party/wil.url "${srcdir}/wil"
    git -c protocol.file.allow=always submodule update

    cd "${srcdir}"/merge-ut-dictionaries/src/merge/

    # Use a dated snapshot for the jawiki dump data
    sed -i -e '124,127d' merge_dictionaries.py
    sed -i -e "s|jawiki-[a-z0-9]\{6,8\}|${srcdir}/jawiki-${_wikidate}|g" merge_dictionaries.py

    # Use our local copy of the Mozc repo
    sed -i -e "65s|os\.path\.exists(f'mozc-{date}.zip')|False|" merge_dictionaries.py
    sed -i -e '71s|zip_ref\.||' merge_dictionaries.py
    sed -i -e "72s|mozc-master/src/data/dictionary_oss/id\.def|${srcdir}/mozc/src/data/dictionary_oss/id\.def|" merge_dictionaries.py
    sed -i -e '74s|id_mozc\.|file\.read()\.|' merge_dictionaries.py
    sed -i -e '80s|zip_ref\.||' merge_dictionaries.py
    sed -i -e "81s|mozc-master/src/data/dictionary_oss/|${srcdir}/mozc/src/data/dictionary_oss/|" merge_dictionaries.py
    sed -i -e '83s|decode()\.||' merge_dictionaries.py
    sed -i -e '53,64d;66,69d;73d' merge_dictionaries.py

    # Compile the UT dictionary
    printf '\nCompiling the UT dictionary...\n\n'

    [[ -e mozcdic-ut.txt ]] && rm mozcdic-ut.txt

    for dict in "${ENABLED_DICTIONARIES[@]}"
    do
        bzip2 -dfk "${srcdir}"/mozcdic-ut-${dict}/mozcdic-ut-${dict}.txt.bz2
        cat "${srcdir}"/mozcdic-ut-${dict}/mozcdic-ut-${dict}.txt >> mozcdic-ut.txt
    done

    python merge_dictionaries.py mozcdic-ut.txt

    # Append the UT dictionary
    cat mozcdic-ut.txt >> "${srcdir}"/mozc/src/data/dictionary_oss/dictionary00.txt
}

build() {
    cd mozc/src

    unset ANDROID_NDK_HOME
    unset ANDROID_HOME
    export JAVA_HOME='/usr/lib/jvm/java-21-openjdk/'

    bazel build server:mozc_server gui/tool:mozc_tool renderer/qt:mozc_renderer unix/ibus:ibus_mozc unix/icons --config oss_linux --compilation_mode opt
}

package() {
    cd mozc/src

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

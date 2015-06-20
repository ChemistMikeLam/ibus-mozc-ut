#!/usr/bin/bash

[[ ! -f generate-mozc-ut.sh ]] && { echo "generate-mozc-ut.sh not found."; exit 1; }

sed -i \
    -e '1s/bash/bash -e/' \
    -e 's/ruby \(.*\)/ruby -EUTF-8 \1/g' \
    generate-mozc-ut.sh \
    edict-katakanago/generate-katakanago.sh

sed -i \
    -e 's/^\(MOZCVER=.*\|DICVER=.*\|NICODIC=.*\)/#&/' \
    -e 's/\$NICODIC/"\$NICODIC"/' \
    -e 's| KEN_ALL.CSV.r| ../../x-ken-all.csv|' \
    -e '/rm -f chimei\/\*.CSV*/d' \
    -e '/rm -f chimei\/\*.zip/d' \
    -e '/rm -f chimei\/gen_zip_code_seed.py/d' \
    -e '/rm -rf ..\/mozc-$MOZCVER\//d' \
    -e 's|mozc-\$MOZCVER|mozc/src|g' \
    -e '/# unpack official mozc/,+6d' \
    -e '/# generate zip code dic/,+11d' \
    -e '/# debian\/rules/,+2d' \
    -e '/# PKGBUILD/,+2d' \
    generate-mozc-ut.sh

sed -i \
    -e '/# get edict/,+1d' \
    -e 's|gzip -d edict.gz|ln -sf \.\./\.\./edict-${DICVER} edict|' \
    edict-katakanago/generate-katakanago.sh

sed -i '71s/s\[5\]/& != "" and &/' chimei/get-entries.rb

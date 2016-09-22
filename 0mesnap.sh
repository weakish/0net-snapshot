#!/bin/sh

# Usage
#
# - Specify zeronet data directory in `$ZERONETDATADIR`.
# - Make sure there is `hub_seeding.lst` in `$zeroNetDataDir`.
#   (a list of hub addresses, one ID per line, can be generated via zerome-crawler).
#
#      0mesnap.sh
#

set -e
set -u

readonly zeroNetDataDir=${ZERONETDATADIR:-/pool/src/ZeroNet/data}

cd $zeroNetDataDir
cat hub_seeding.lst | xargs git add
git commit -m "Auto commit."

#!/bin/sh

# Usage
#
# - Edit `$zeroNetDataDir`.
# - Make sure there is `hub_seeding.lst` in `$zeroNetDataDir`.
#   (a list of hub addresses, one ID per line, can be generated via zerome-crawler).
#
#      0mesnap.sh
#

set -e
set -u

readonly zeroNetDataDir=${ZERONETDATADIR:-$(pwd)}

cd zeroNetDataDir
cat hub_seeding.lst | xargs git add
git commit -m "Auto commit."

#!/bin/sh

# Usage
#
# ./0mesnap.sh
#
# Dependencies
#
# - Put [zerome-crawler.jar](https://weakish.github.io/zerome-crawler/)
#   under environment variable $ZERONETDATADIR (default to current directory).
#
# - [entr](http://entrproject.org/) in $PATH
#
# - unix like os, e.g. Linux, BSD, and macOS.

set -e
set -u

readonly zeroNetDateDir=${ZERONETDATADIR:-$(pwd)}

cd zeroNetDateDir
java -jar zerome-crawler.jar --all -1 --seeding > hub_seeding.lst
cat hub_seeding.lst | sed -r 's/$/\/\*/' | tr '\n' ' ' > hub_seeding.pattern
source hub_seeding.pattern |
entr sh -c 'cat hub_seeding.lst | xargs git add && git commit -m "Auto commit."'

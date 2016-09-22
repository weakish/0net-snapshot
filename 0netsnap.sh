#!/bin/sh

your_zeronet_folder="/pool/src/ZeroNet/data"

cd $your_zeronet_folder
# This assumes git operations (blocking) are fast.
# It is better to use a queue, e.g.
# https://github.com/leifdenby/shellqueue
# Or switch to another language with decent async queue library.
inotifywait -mrq -e delete,close_write \
    --exclude ".*\.db"  --exclude ".*\.db-journal" --exclude "content.json"
    "$your_zeronet_folder" | while read path event name ; do
    if [ $event = 'DELETE' ]; then
        # Give meaning error message if git repository does not exist.
        git rm "$path$name"
    else
        git add "$path$name"
    fi
    # TODO Use separated git repositories per site.
    echo git commit -m 'Auto commit.'
done

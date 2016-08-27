#!/bin/sh

your_zeronet_folder="$HOME/ZeroBundle/ZeroNet/data"

cd $your_zeronet_folder
# This assumes git operations (blocking) are fast.
# It is better to use a queue, e.g.
# https://github.com/leifdenby/shellqueue
# Or switch to another language with decent async queue library.
inotifywait -mrq -e create,delete,modify \
    --exclude ".*\.db"  --exclude ".*\.db-journal"
    "$your_zeronet_folder" | while read path event name ; do
    if [ $event = 'DELETE' ]; then
        # Give meaning error message if git repository does not exist.
        git rm "$path/name"
    else
        git add "$path/name"
    fi
    # TODO Use separated git repositories per site.
    git commit -m 'Auto commit.' "$path/name"
done

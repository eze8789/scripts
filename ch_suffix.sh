#!/bin/bash

# Changes the suffixes from the first argument to the second argument for
# all files specified after that as arguments. Use globstar expansion to
# recurse.

chsuffix () 
{ 
    declare i
    declare from="$1"
    shift
    declare to="$1"
    shift
    declare files=("$@")
    if [[ -z "$files" ]]; then
        usageln 'chsuffix <from> <to> <file> ...'
        return 1
    fi
    for i in "${files[@]}"
    do
        if [[ "$i" =~ $from$ ]]; then
            declare stripped=${i%$from}
            telln "Moving $i"'` -> `'"$stripped$to"
            mv "$i" "$stripped$to"
        fi
    done
}

chsuffix $*


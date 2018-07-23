#!/bin/bash
# DEPENDENCIES:
#   grep
#   tr
#   sort
#   uniq

# ARGUMENTS
#   $1 - Changelog file path
#   $2 - username/repository (Example: 'TripleParity/docks-ui')

# get_issue_list()
#   $1 - changelog file path
#
# DESCRIPTION:
#   Issues referenced in the form '[#xxx]' will be returned as a sorted
#   list in the form 'xxx'
get_issue_list () {
    local changelog=$1
    grep -o '\[#[0-9]*\]' $changelog | tr -d '[#' | tr -d ']' | sort -h -r | uniq
}

issues=$(get_issue_list $1 $2)

for i in $issues
do
    echo "[#$i]: https://github.com/$2/issues/$i"
done


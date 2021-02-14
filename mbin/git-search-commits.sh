#!/bin/bash

USAGE="\n
Usage: git-search-commits <regex> [search path] [--help]\n
\n
Given a regular expression (<regex>), search the entire\n
git repo in the current working directory. Optionally,\n
specify a path (<search path>) in the repo to direct the\n
search.\n
\n
Examples:\n\n
# Search for the string \"/TOKEN/\" in all commits of the repo\n
git-search-commits TOKEN\n
\n
# Search in the file lib/block.go in all commits for strings \n
# matching the regex \"/API*TOKEN/\"\n
git-search-commits \"/API*TOKEN/\" lib/block.go\n
\n
"

if [[ "$1" == "--help" ]]
then
    echo -e $USAGE
    exit 1
fi

if [[ $# < 1 ]]
then
    echo "ERROR: The regex string is a required parameter"
    echo -e $USAGE
    exit 1
fi

echo -e "\nregex: $1"

if [[ $# > 1 ]]
then
    FILEPATH="-- ${2}"
    echo -e "path:  $FILEPATH\n"
fi

git grep ${1} $(git rev-list --all ${FILEPATH}) ${FILEPATH}

exit 0

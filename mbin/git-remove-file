#!/bin/bash

USAGE="\n
Usage: git-remove-file <path> [--help]\n
\n
Given a file path (<path>), remove all commits for this\n
file in the git repo in the current working directory.\n
\n
Examples:\n\n
# remove file "bin/badness" from all commits of the repo\n
git-remove-file bin/badness\n
\n
"

if [[ "$1" == "--help" ]]
then
    echo -e $USAGE
    exit 1
fi

if [[ $# < 1 ]]
then
    echo "ERROR: The file path is a required parameter"
    echo -e $USAGE
    exit 1
fi

echo -e "\nfile path: $1"

git filter-branch --force --index-filter "git rm --cached --ignore-unmatch ${1}" --prune-empty --tag-name-filter cat -- --all

echo -e "\nWhen satisfied with the changes, run this command to commit:"
echo -e "\n\tgit push origin --force --all\n"
echo -e "\nRun these commands to garbage collect objects to ensure all completely gone:"
echo -e "\n\tgit for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin"
echo -e "\n\tgit reflog expire --expire=now --all"
echo -e "\n\tgit gc --prune=now\n"

exit 0

#!/bin/bash

USAGE="\n
Usage: git-import-repo <path> [--help]\n
\n
Given the path (<path>) to a git repo, import all the commits of the git\n
repo at the specified path into the git repo from which this script is run.\n
\n
Examples:\n\n
# import the git repo at the path "/home/fred/src/repo"\n
# i.e. the "repo" directory includes a ".git" subdirectory\n
git-import-repo /home/fred/src/repo\n
\n
"

if [[ "$1" == "--help" ]]
then
    echo -e $USAGE
    exit 1
fi

if [[ $# < 1 ]]
then
    echo "ERROR: The git repo path is a required parameter"
    echo -e $USAGE
    exit 1
fi

git status >/dev/null 2>&1
if [[ $? -ne 0 ]]
then
    echo "ERROR: You must run this script within a git repo"
    echo -e $USAGE
    exit 1
fi

pushd $1 >/dev/null 2>&1
if [[ $? -ne 0 ]]
then
    echo "ERROR: import path \"$1\" does not exist!"
    echo -e $USAGE
    exit 1
fi

git status >/dev/null 2>&1
if [[ $? -ne 0 ]]
then
    echo "ERROR: The import path \"$1\" does not contain a git repo!"
    echo -e $USAGE
    exit 1
fi
popd >/dev/null 2>&1

echo -e "\nImporting commits from git repo @ path: $1"

git remote add importsrc $1
git pull importsrc master --allow-unrelated-histories
git status
git remote remove importsrc
git push

exit 0

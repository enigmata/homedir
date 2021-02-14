#!/bin/sh

# Derived from https://help.github.com/articles/changing-author-info/

USAGE="
Usage: git-change-author <name> <old email addr> <new email addr> [--help]

Change the author (<name>) of all commits from <old email addr> to <new email addr>.

Example:

# change author 'Randy Horman' from old@name.co to new@name.co
git-change-author 'Randy Horman' old@name.com new@name.co
"

if [[ "$1" == "--help" ]]
then
    echo "$USAGE"
    exit 1
fi

if [[ $# < 3 ]]
then
    echo "\nERROR: \"name\", \"old email addr\", and \"new email addr\" are required parameters"
    echo "$USAGE"
    exit 1
fi

echo "\nname:      $1"
echo "old email: $2"
echo "new email: $3"

git filter-branch --env-filter '
OLD_EMAIL="$2"
CORRECT_NAME="$1"
CORRECT_EMAIL="$3"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

echo "\nDone.\n"
echo "If you are satisfied with the result, run:"
echo "\tgit push --force --tags origin 'refs/heads/*'\n"

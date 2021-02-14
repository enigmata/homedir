#!/bin/bash --posix

for F in *.html
do
    if [[ $F =~ ^(.+\..+)\.html$ ]]
    then
        echo $F ${BASH_REMATCH[1]}
        mv $F ${BASH_REMATCH[1]}
    fi
done

#!/bin/bash --posix

INDEXWIDTH=5

for PREFIX in `find . -type d ! -name '.'`
do
    for PIC in ../${PREFIX}*
    do
        if [[ $PIC =~ ^\.\.\/${PREFIX}([[:digit:]]+)\.([[:alpha:]]{3})$ ]]
        then
            INDEX=$(expr ${BASH_REMATCH[1]})
            NEWNAME=$(printf ".%s%0${INDEXWIDTH}d.%s\n" $PREFIX $INDEX ${BASH_REMATCH[2]})
            echo "moving $PIC to $NEWNAME"
            mv $PIC $NEWNAME
        fi
    done
done

#!/bin/bash --posix

INDEXWIDTH=5

for PREFIX in `find . -type d ! -name '.'`
do
    MAX_PIC=`ls -r ../${PREFIX}* | head -1`

    if [[ $MAX_PIC =~ ^.*${PREFIX}([[:digit:]]+)\.[[:alnum:]]+$ ]]
    then
        INDEX=$(expr ${BASH_REMATCH[1]})
        if [[ `find $PREFIX -type f | wc -l` -gt 0 ]]
        then
            for FROM_PIC in $PREFIX/*
            do
                if [[ $FROM_PIC =~ ^.*\.([[:alnum:]]+)$ ]]
                then
                    INDEX=$((INDEX + 1))
                    TO_PIC=$(printf "../%s%0${INDEXWIDTH}d.%s\n" $PREFIX $INDEX ${BASH_REMATCH[1]})
                    echo "moving $FROM_PIC to $TO_PIC"
                    mv "$FROM_PIC" $TO_PIC
                fi
            done
        fi
    fi
done

#!/bin/bash --posix

INDEXWIDTH=5

for PREFIX in `find . -type d ! -name '.'`
do
    MAX_PIC=`ls -r ../${PREFIX}* | head -1`

    if [[ $MAX_PIC =~ ^.*${PREFIX}([[:digit:]]+)\.[[:alnum:]]+$ ]]
    then
        MAX_INDEX=$(expr ${BASH_REMATCH[1]})
        echo $PREFIX - $MAX_INDEX
        for ((INDEX = 0; INDEX < $MAX_INDEX; INDEX += 1))
        do
            PIC=$(printf "../%s%0${INDEXWIDTH}d.*\n" $PREFIX $INDEX)
            if [ ! -f $PIC ]
            then
                echo $PIC
            fi
        done
    fi 
done

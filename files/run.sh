#!/bin/bash -x

set -e

export BUILD_DIR=/kohadevbox
export TEMP=/tmp

#while ! nc -z db 3306; do sleep 1; done

#dpkg -l
dpkg -l | grep mojo
dpkg -l | grep openapi
dpkg -l | grep validator

if [ "$RUN_TESTS_AND_EXIT" = "yes" ]; then

    cd ${BUILD_DIR}/koha
    rm -rf /cover_db/*

    if  apt install -s koha-common ; then
        touch testing.success;
        echo command returned true;
    else
        echo command returned some error
    fi


else
    # TODO: We could use supervise as the main loop
    /bin/bash -c "trap : TERM INT; sleep infinity & wait"
fi

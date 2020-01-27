#!/bin/bash -c

echo '66666666666666666666666666666666666666666666'
set -e

export BUILD_DIR=/kohadevbox
export TEMP=/tmp

# while ! nc -z db 3306; do sleep 1; done

# dpkg -l

# dpkg -l | grep mojo
# dpkg -l | grep openapi
# dpkg -l | grep validator

echo '7777777777777777777777777777777777777777777777'
if [ "$RUN_TESTS_AND_EXIT" = "yes" ]; then

    if apt install -y koha-common1; then
        touch testing.success
        exit 0;
    else
        exit 2;
    fi

else
    exit 2;

    # TODO: We could use supervise as the main loop
#    /bin/bash -c "trap : TERM INT; sleep infinity & wait"

fi


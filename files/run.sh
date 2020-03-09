#!/bin/bash
set -e

export BUILD_DIR=/kohadevbox
export TEMP=/tmp

# while ! nc -z db 3306; do sleep 1; done


apt update
#apt install -y


 dpkg -l

 dpkg -l | grep mojo
 dpkg -l | grep openapi
 dpkg -l | grep validator



if apt install -y -s koha-common; then
    echo "TESTS OK!"
fi

if apt install -y koha-common; then
    echo "TESTS OK!"
fi

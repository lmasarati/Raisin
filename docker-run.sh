#!/bin/bash

DOCKER_RM="--rm"
[ "$1" = "DEBUG" ] && unset DOCKER_RM

docker run $DOCKER_RM \
 --cap-add ALL \
 -v $(pwd):/work \
 debian:buster-slim \
 /work/docker-compile.sh

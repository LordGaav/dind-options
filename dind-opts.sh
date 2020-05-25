#!/bin/sh

# Disable TLS mode which was enabled by default in Docker 19
# Allow manual override using DOCKER_TLS_CERTDIR_OVERRIDE
export DOCKER_TLS_CERTDIR="${DOCKER_TLS_CERTDIR_OVERRIDE:-}"

exec dockerd-entrypoint.sh $DOCKER_OPTS $@

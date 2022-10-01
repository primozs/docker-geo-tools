#!/bin/sh

docker run --rm -e "TERM=xterm-256color" -w /home -v $(pwd):/home registry.susa.cloud/docker-geo-tools:v0.0.1 "$@"
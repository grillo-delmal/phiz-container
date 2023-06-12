#!/usr/bin/bash

podman build -t inochi-build .

podman run -ti --rm \
    -p 4173:4173 \
    localhost/phiz
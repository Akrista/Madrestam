#!/bin/bash
docker run --rm -it --name madrestam --shm-size 256M --network=host --privileged -v steam:/steam madrestam
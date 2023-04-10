#!/bin/bash
docker run --rm -it --name madresteam -p 5880:5800 --shm-size 256M --privileged -v /steam:/steam akrista/madresteam
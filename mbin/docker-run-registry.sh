#!/bin/bash

docker run -d -p 5000:5000 --restart=always --name registry -v /usr/local/var/docker/data:/var/lib/registry registry:2

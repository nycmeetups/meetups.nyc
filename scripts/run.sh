#!/bin/bash

cd "$(dirname "$0")"/..

docker run -it --rm -p 8080:80 -p 8081:443 -v $PWD:/var/www/meetups.nyc:ro meetups.nyc/server:latest /bin/bash -c './scripts/deploy.sh && bash'

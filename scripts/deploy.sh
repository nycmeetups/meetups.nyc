#!/bin/bash

cd "$(dirname "$0")"/..

if [ -f /.dockerenv ]; then
  ENV="dev"
else
  ENV="prod"
fi

rm /etc/nginx/sites-enabled/default >/dev/null 2>&1

if [ "$ENV" == "dev" ]; then
  cp ./conf/meetups-dev.nyc.nginx /etc/nginx/sites-enabled/meetups-insecure.nyc.conf
else
  cp ./conf/meetups-insecure.nyc.nginx /etc/nginx/sites-enabled/meetups-insecure.nyc.conf
fi

cp ./conf/meetups.nyc.nginx /etc/nginx/sites-enabled/meetups.nyc.conf

service nginx status >/dev/null 2>&1
status="$?"

if [[ "$status" -eq 0 ]]; then
  service nginx reload
else
  service nginx start
fi

#!/bin/bash

cd "$(dirname "$0")"/..

# chown -R www-data /var/www/meetups.nyc/public
# chmod -R 500 /var/www/meetups.nyc/public

rm /etc/nginx/sites-enabled/default >/dev/null 2>&1

cp ./conf/meetups.nyc.nginx /etc/nginx/sites-enabled/meetups.nyc.conf

service nginx status >/dev/null 2>&1
status="$?"

if [[ "$status" -eq 0 ]]; then
  service nginx reload
else
  service nginx start
fi

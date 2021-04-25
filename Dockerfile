FROM ubuntu

RUN apt-get update && apt-get install -y \
  curl \
  nginx

RUN mkdir -p /etc/letsencrypt/live/meetups.nyc

# create dummy cert just for development
RUN openssl req -nodes -new -x509 -days 365 \
  -passout pass:insecure \
  -subj "/C=US/ST=New York/L=New York City/O=meetups.nyc/OU=meetups.nyc devs/CN=meetups.nyc" \
  -out /etc/letsencrypt/live/meetups.nyc/fullchain.pem \
  -keyout /etc/letsencrypt/live/meetups.nyc/privkey.pem

ADD . /var/www/meetups.nyc

WORKDIR /var/www/meetups.nyc

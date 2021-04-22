FROM ubuntu

RUN apt-get update && apt-get install -y \
  curl \
  nginx

# create dummy cert just for development
RUN openssl req -nodes -new -x509 -days 365 \
  -passout pass:insecure \
  -subj "/C=US/ST=New York/L=New York City/O=meetups.nyc/OU=meetups.nyc devs/CN=meetups.nyc" \
  -out /etc/ssl/certs/ssl-cert-meetups-nyc.pem \
  -keyout /etc/ssl/private/ssl-cert-meetups-nyc.key

ADD . /var/www/meetups.nyc

WORKDIR /var/www/meetups.nyc

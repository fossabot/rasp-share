# rasp-share

[![Build Status](https://travis-ci.org/jrrombaldo/rasp-share.svg?branch=master)](https://travis-ci.org/jrrombaldo/rasp-share)


run with following command:

```
export dir_share=/tmp/share
export container_name=rasp-share

docker run -itd \
  --net host \
  -p 5353:5353/udp \
  -p 548:548 \
  -p 427:427 \
  -p 1935:1935 \
  -p 202:202 \
  -p 204:204 \
  -p 206:206 \
  -v $dir_share:/shared \
  --hostname=$container_name \
  --name=$container_name \
  --restart unless-stopped \
  jrromb/plex-share

```
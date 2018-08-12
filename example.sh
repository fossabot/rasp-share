#!/bin/bash

name="share-local"

rm -rf /tmp/shared
mkdir /tmp/shared
mkdir /tmp/shared/filmes
mkdir /tmp/shared/backup

docker rm -f $name
docker build -t $name .

# using "--net host" because docker is not working with UDP ports at the moment.
docker run -itd \
 --net host \
 -p 5353:5353/udp \
 -p 548:548 \
 -p 427:427 \
 -p 1935:1935 \
 -p 202:202 \
 -p 204:204 \
 -p 206:206 \
 -v /tmp/shared:/shared \
 --hostname=$name \
 --name=$name \
 --restart unless-stopped \
 $name

echo -e "test\ntest" | docker exec -i $name passwd share_user

docker exec -it $name bash

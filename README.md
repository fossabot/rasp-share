# rasp-share

[![Build Status](https://travis-ci.org/jrrombaldo/rasp-share.svg?branch=master)](https://travis-ci.org/jrrombaldo/rasp-share)


run with following command:



the default user and password is share_user:default
```
export dir_share=
export container_name=share
export pw=""


docker run -itd \
-p 5353:5353/udp \
-p 548:548 \
-p 427:427 \
-p 1935:1935 \
-p 202:202 \
-p 204:204 \
-p 206:206 \
-v $dir_share:/shared \
--env SHARE_PWD="$pw" \
--hostname=$container_name \
--name=$container_name \
--restart unless-stopped \
jrromb/rasp-share
  
  
  
  
export dir_share=<>
export container_name=<>
export pw=""


docker run -itd \
--net host \
-v $dir_share:/shared \
--env SHARE_PWD="$pw" \
--hostname=$container_name \
--name=$container_name \
--restart unless-stopped \
jrromb/rasp-share
   
    
    
```
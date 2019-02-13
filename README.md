# rasp-share

[![Build Status](https://travis-ci.org/jrrombaldo/rasp-share.svg?branch=master)](https://travis-ci.org/jrrombaldo/rasp-share)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fjrrombaldo%2Frasp-share.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fjrrombaldo%2Frasp-share?ref=badge_shield)

#Requirements

### Docker net host
For this container to run properly, it must run on `--net=host` mode, otherwise the avahi will not work well and a consequence the shared volume will not be pusblished.

### Disable avahi on the host
Another requirement is to disable the `avahi-daemon` on the host:
```
sudo update-rd avahi-daemon remove

sudo service avahi-daemon stop
```


# Running the conatiner

```bash
docker run -itd \
--net host \
-v /media/pi/extern_disk:/shared \
--env SHARE_USER= <your_user> \
--env SHARE_PWD= <your_password> \
--hostname=share \
--name=share \
jrromb/rasp-share
```


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fjrrombaldo%2Frasp-share.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fjrrombaldo%2Frasp-share?ref=badge_large)
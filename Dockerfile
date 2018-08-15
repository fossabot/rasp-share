FROM raspbian/jessie:latest

RUN apt-get update -y \
  && apt-get upgrade -y

RUN apt-get install netatalk  --no-install-recommends -y
RUN apt-get install avahi-daemon avahi-utils  --no-install-recommends -y

#RUN apt-get install net-tools vim -y

RUN apt-get -qq -y autoclean \
  && apt-get -qq -y autoremove \
  && apt-get -qq -y clean


ADD afp.service /etc/avahi/services/afpd.service
ADD afpd.conf /etc/netatalk/afpd.conf
ADD AppleVolumes.default /etc/netatalk/AppleVolumes.default
ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf


ENV SHARE_USER=share_user
ENV SHARE_PWD=default


#according to :https://wiki.archlinux.org/index.php/Netatalk

#Bonjour/Zeroconf:   mdns/udp
EXPOSE 5353/udp
#AFP:                afpovertcp/tcp
EXPOSE 548
#SLP:                slp/tcp
EXPOSE 427
#AppleTalk:          at-rtmp/tcp
EXPOSE 1935
#AppleTalk:          at-nbp/tcp
EXPOSE 202
#AppleTalk:          at-echo/tcp
EXPOSE 204
#AppleTalk:          at-zis/tcp
EXPOSE 206




VOLUME ["shared"]
RUN useradd share_user

#RUN /etc/init.d/dbus start
#RUN /etc/init.d/netatalk restart
#RUN /etc/init.d/avahi-daemon restart

COPY start_all.sh /opt/start_all.sh
RUN chmod +x /opt/start_all.sh

CMD ("/opt/start_all.sh")

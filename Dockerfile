FROM ubuntu:latest

RUN add-apt-repository ppa:qbittorrent-team/qbittorrent-stable

RUN apt-get update 

RUN apt-get install qbittorrent

RUN adduser qbtuser &&  gpasswd -a qbtuser  

RUN systemctl enable qbittorrent && systemctl start qbittorrent

#WORKDIR /usr/src/app

#CMD ["java", "-Xmx728m", "-jar", "acq-merchant-info-orc.jar", "--spring.profiles.active=${env}"]

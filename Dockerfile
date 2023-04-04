FROM ubuntu:latest

RUN sudo apt-get update && sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable

RUN sudo apt-get install qbittorrent-nox

RUN sudo adduser qbtuser && sudo gpasswd -a qbtuser sudo 

RUN sudo echo -e '[Unit]\n Description=qBittorrent Daemon Service\n After=network.target\n \n [Service]\n Type=forking\n User=qbtuser\n ExecStart=/usr/bin/qbittorrent-nox -d\n \n [Install]\n WantedBy=multi-user.target'| sudo tee /etc/systemd/system/qbittorrent-nox.service

RUN sudo systemctl enable qbittorrent-nox && sudo systemctl start qbittorrent-nox

#WORKDIR /usr/src/app

#CMD ["java", "-Xmx728m", "-jar", "acq-merchant-info-orc.jar", "--spring.profiles.active=${env}"]

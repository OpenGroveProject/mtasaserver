FROM ubuntu:latest

LABEL maintainer="opengroveproject@gmail.com"

RUN apt-get update && apt-get upgrade -y

RUN dpkg --add-architecture i386

RUN apt-get update

RUN apt-get install zip bash tar unzip lib32z1 lib32ncurses5 screen wget -y

COPY mtasa-install.sh /app/

RUN chmod a+x /app/mtasa-install.sh

RUN bash /app/mtasa-install.sh

EXPOSE 22003/udp 22005 22126/udp

CMD ["./multitheftauto_linux_x64/mta-server64"]

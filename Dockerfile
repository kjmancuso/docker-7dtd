FROM steamcmd/steamcmd:latest

LABEL maintainer="kremlinkev <kevin@mancu.so>"

ARG DEBIAN_FRONTEND=noninteractive

RUN useradd -d /steam -m steam

USER steam

ENV USER steam
ENV HOME /steam

RUN steamcmd +login anonymous +force_install_dir /steam/7dtd +app_update 294420 validate +quit

COPY start.sh /

EXPOSE 26900/tcp
EXPOSE 26900/udp
EXPOSE 26901/udp
EXPOSE 26902/udp
EXPOSE 8080/tcp
EXPOSE 8081/tcp

ENV START_ARGS "-nographics -dedicated -quit -batchmode"

VOLUME /config

ENTRYPOINT []

CMD /start.sh

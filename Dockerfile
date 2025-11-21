# syntax=docker/dockerfile:1

FROM eclipse-temurin:18-jdk

LABEL version="2.0.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="DawnCraft - 2.0.16_hf"
LABEL homepage.icon="https://media.forgecdn.net/avatars/961/81/638457067445019871.gif"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://Dawn-Craft:25565
RUN apt-get update && apt-get install -y curl unzip && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

CMD ["/launch.sh"]

ENV MOTD " Server Powered by Docker"
ENV LEVEL world
ENV JVM_OPTS "-Xms4096m -Xmx8192m"
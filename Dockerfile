FROM anapsix/alpine-java

ENV JAVA_ARGS="-Xmx3G -Xms2G"
ENV SERVER_OP=""

RUN apk add unzip
RUN apk add wget
RUN apk add tmux

RUN mkdir /minecraft
RUN wget -O /tmp/tekkit.zip http://servers.technicpack.net/Technic/servers/tekkit-legends/Tekkit_Legends_Server_v1.1.1.zip
RUN unzip /tmp/tekkit.zip -d /minecraft/

COPY ./launch.sh /minecraft/launch.sh
RUN chmod +x /minecraft/launch.sh

VOLUME /minecraft
EXPOSE 25565

WORKDIR /minecraft
RUN echo "eula=true" > /minecraft/eula.txt
ENTRYPOINT ["/minecraft/launch.sh"]
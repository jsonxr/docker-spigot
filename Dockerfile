FROM openjdk:8

MAINTAINER jsonxr <jsonxr@gmail.com>

# expose minecraft ports
EXPOSE 25565
EXPOSE 8123

# Linux update
ENV LINUX_UPDATE=2019-05-02
RUN apt-get update && apt-get install -y git && apt-get clean all
#RUN yum update --assumeyes && yum install --assumeyes git && yum clean all

# Install spigot
ENV SPIGOT_VERSION=1.14
RUN useradd -s /bin/bash -d /minecraft -m minecraft && \
    mkdir /minecraft-build && \
    cd /minecraft-build && \
    curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN cd /minecraft-build && HOME=/minecraft-build java -jar BuildTools.jar --rev 1.14

# Copy defaults
COPY /src/ /
WORKDIR /minecraft

#set default command
CMD ["java", "-Xms1G", "-Xmx1G", "-jar", "spigot.jar"]

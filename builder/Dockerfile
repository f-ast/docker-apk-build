FROM alpine:edge
ADD repositories /etc/apk/repositories
RUN apk update 
RUN apk -U add alpine-sdk
RUN apk -U add cmake libarchive-dev libxml2-dev libxslt-dev curl-dev boost-dev libantlr3c-dev openssl-dev
RUN apk -U add openjdk8
RUN apk -U add ninja
RUN apk -U add sqlite-dev
RUN apk -U add wget
RUN cd /usr/local/lib && wget https://www.antlr.org/download/antlr-4.7.2-complete.jar
RUN apk -U add gtest gtest-dev
RUN apk -U add libgit2 libgit2-dev
RUN mkdir -p /var/cache/distfiles && \
    adduser -D packager && \
    addgroup packager abuild && \
    chgrp abuild /var/cache/distfiles && \
    chmod g+w /var/cache/distfiles && \
    echo "packager    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ADD     setup.sh /home/packager/bin/setup.sh
WORKDIR /work
USER    packager

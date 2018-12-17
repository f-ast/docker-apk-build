FROM    alpine:3.8
#ADD     repositories /etc/apk/repositories
RUN     apk update 
RUN     apk -U add alpine-sdk
RUN     apk -U add cmake libarchive-dev libxml2-dev libxslt-dev curl-dev boost-dev sqlite-dev libgit2 libgit2-dev
#libantlr3c-dev 
#openssl-dev
RUN     apk -U add openjdk8
RUN     apk -U add py-setuptools
RUN     mkdir -p /var/cache/distfiles && \
        adduser -D packager && \
        addgroup packager abuild && \
        chgrp abuild /var/cache/distfiles && \
        chmod g+w /var/cache/distfiles && \
        echo "packager    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ADD     setup.sh /home/packager/bin/setup.sh
# TODO: customize /etc/abuild.conf

WORKDIR /work
USER    packager

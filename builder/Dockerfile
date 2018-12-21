FROM    alpine:3.8
RUN     apk update 
RUN     apk -U add alpine-sdk libarchive-dev libxml2-dev libxslt-dev curl-dev boost-dev sqlite-dev libgit2 libgit2-dev openjdk8 coreutils
RUN     mkdir -p /var/cache/distfiles && \
        adduser -D packager && \
        addgroup packager abuild && \
        chgrp abuild /var/cache/distfiles && \
        chmod g+w /var/cache/distfiles && \
        echo "packager    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ADD     setup.sh /home/packager/bin/setup.sh
WORKDIR /work
USER    packager

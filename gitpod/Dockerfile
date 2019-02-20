FROM yijun/fast:base
RUN addgroup -g 33333 gitpod && \
    adduser -G gitpod -u 33333 -s /bin/bash -D gitpod
RUN chmod g+rw /home && \
    chown -R gitpod:gitpod /home/gitpod && \
    mkdir -p /workspace && \
    chown -R gitpod:gitpod /workspace;
RUN mkdir -p /root && touch /root/dontBreakMyBuild
RUN apk add --update --no-cache --allow-untrusted fast@testing
RUN pip3 install ggnn
RUN pip3 uninstall -y flatast
RUN pip3 install flatast
ENV HOME=/home/gitpod
ENV GITPOD_HOME /home/gitpod
ENV GITPOD_UID_GID 33333
ENV SHELL /bin/bash
ENV USE_LOCAL_GIT true
WORKDIR $HOME
USER gitpod

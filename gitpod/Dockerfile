FROM node:8-alpine
RUN apk add --no-cache make gcc g++ python
ARG version=latest
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
ENV HOME=/home/gitpod
WORKDIR $HOME
# custom Bash prompt
RUN { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> .bashrc

ADD $version.package.json ./package.json
ARG GITHUB_TOKEN
RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn gitpod build && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    rm -rf ./node_modules/electron && \
    yarn cache clean
RUN addgroup gitpod && \
    adduser -G gitpod -s /bin/sh -D gitpod;
RUN chmod g+rw /home && \
    mkdir -p /workspace && \
    chown -R gitpod:gitpod /home/gitpod && \
    chown -R gitpod:gitpod /workspace;
RUN apk add --no-cache git openssh bash
ENV SHELL /bin/bash
ENV USE_LOCAL_GIT true
ADD repositories /etc/apk/repositories
ADD user.abuild /etc/apk/keys
ADD target /repo
RUN apk add parallel bash git openjdk8 coreutils perl jq make gcc g++ gdb libgit2-dev libxml2-dev sqlite-dev python3-dev libxml2-dev libxslt-dev \
    python3 py3-pip python3-dev
RUN apk upgrade musl
RUN apk add --allow-untrusted srcml@testing srcSlice@testing protobuf@testing flatbuffers@testing antlr4@testing gumtree@testing
RUN pip3 install protobuf flatbuffers tqdm bs4 urllib3
RUN apk add --update --no-cache --allow-untrusted fast@testing
RUN pip3 install ggnn
RUN pip3 uninstall -y flatast
RUN pip3 install flatast
USER gitpod

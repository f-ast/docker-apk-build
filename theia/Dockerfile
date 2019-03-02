FROM node:8-alpine
RUN apk add --no-cache make gcc g++ python
ARG version=latest
WORKDIR /home/theia
ADD $version.package.json ./package.json
ARG GITHUB_TOKEN
RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    rm -rf ./node_modules/electron && \
    yarn cache clean
RUN addgroup theia && \
    adduser -G theia -s /bin/sh -D theia;
RUN chmod g+rw /home && \
    mkdir -p /home/project && \
    chown -R theia:theia /home/theia && \
    chown -R theia:theia /home/project;
RUN apk add --no-cache git openssh bash
ENV HOME /home/theia
WORKDIR /home/theia
RUN chown -R theia:theia /home/theia
EXPOSE 3000
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
USER theia
ENTRYPOINT [ "node", "/home/theia/src-gen/backend/main.js", "/home/project", "--hostname=0.0.0.0" ]

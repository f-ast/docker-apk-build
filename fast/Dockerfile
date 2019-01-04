FROM alpine:edge
ADD repositories /etc/apk/repositories
ADD user.abuild /etc/apk/keys
ADD target /repo
#RUN apk update
RUN apk add parallel bash git openjdk8 coreutils perl jq make gcc g++ gdb libgit2-dev libxml2-dev sqlite-dev python3-dev libxml2-dev libxslt-dev \
    python3 py3-pip python3-dev
RUN apk add --allow-untrusted srcml@testing srcSlice@testing protobuf@testing flatbuffers@testing antlr4@testing gumtree@testing
RUN pip3 install protobuf flatbuffers tqdm bs4 urllib3
#sklearn tensorboardX scipy numpy
#torch lxml 

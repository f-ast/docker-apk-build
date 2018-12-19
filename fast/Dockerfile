FROM alpine:edge
ADD repositories /etc/apk/repositories
ADD user.abuild /etc/apk/keys
ADD target /repo
RUN apk update
RUN apk add --update --no-cache \
    perl jq parallel bash git\
    python3 py3-pip \ 
    make gcc g++ libgit2-dev libxml2-dev sqlite-dev openjdk8 coreutils libgit2
#python2 py2-pip \
RUN pip3 install protobuf flatbuffers tqdm
#RUN pip2 install protobuf flatbuffers tqdm
RUN apk add --update --no-cache --allow-untrusted srcml@testing srcSlice@testing protobuf@testing flatbuffers@testing antlr4@testing 
RUN apk add --update --no-cache python3-dev python2-dev libxml2-dev libxslt-dev
RUN pip3 install flatast ggnn lxml bs4 urllib3
#RUN pip2 install flatast ggnn lxml bs4 urllib3

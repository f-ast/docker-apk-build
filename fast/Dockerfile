FROM alpine:edge
ADD repositories /etc/apk/repositories
ADD user.abuild /etc/apk/keys
ADD target /repo
#RUN apk update
RUN apk add perl jq parallel bash git\
	    openjdk8 coreutils \
    	    python3 py3-pip \ 
    	    make gcc g++ gdb \
	    libgit2-dev libxml2-dev sqlite-dev python3-dev libxml2-dev libxslt-dev
RUN apk add --allow-untrusted srcml@testing srcSlice@testing protobuf@testing flatbuffers@testing antlr4@testing
RUN pip3 install --upgrade pip
RUN pip3 install pyyaml
RUN apk add -U cmake
RUN pip3 install git+https://github.com/pytorch/pytorch
RUN pip3 install protobuf flatbuffers tqdm bs4 urllib3
#sklearn tensorboardX twine scipy numpy pyarrow 
#torch lxml 

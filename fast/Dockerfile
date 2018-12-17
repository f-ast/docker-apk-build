FROM alpine:edge
ADD repositories /etc/apk/repositories
ADD user.abuild /etc/apk/keys
ADD target /repo
RUN apk update
RUN apk add --update --no-cache --allow-untrusted fast@testing perl jq python3 py3-pip python2 py2-pip
RUN pip3 install protobuf flatbuffers tqdm
RUN pip2 install protobuf flatbuffers tqdm
WORKDIR /e
ENTRYPOINT ["/usr/bin/fast"]

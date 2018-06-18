FROM alpine:edge
ADD repositories /etc/apk/repositories
ADD user.abuild /etc/apk/keys
ADD target /repo
RUN apk update
RUN apk add --update --no-cache --allow-untrusted fast@testing python3 perl jq py3-pip
RUN pip3 install protobuf flatbuffers tqdm

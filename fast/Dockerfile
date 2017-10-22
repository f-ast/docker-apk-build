FROM alpine:edge
ADD repositories /etc/apk/repositories
ADD user.abuild /etc/apk/keys
ADD target /repo
RUN apk update
RUN apk add --update --no-cache --allow-untrusted fast@testing python perl jq py2-pip
RUN pip install protobuf

FROM alpine:edge
ADD repositories /etc/apk/repositories
ADD user.abuild /etc/apk/keys
ADD target /repo
RUN apk update
RUN apk add --allow-untrusted fast@testing
RUN apk add -U --no-cache python
RUN apk add -U --no-cache py2-pip
RUN pip install protobuf

FROM alpine:edge
ADD repositories /etc/apk/repositories
ADD user.abuild /etc/apk/keys
ADD target /repo
RUN apk update
RUN apk add --allow-untrusted fast@testing

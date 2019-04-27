from yijun/fast:base
RUN apk update
RUN apk add -U libgit2-dev libgit2
RUN apk add --allow-untrusted fast@testing
RUN pip3 install ggnn
RUN pip3 install flatast
WORKDIR /e
ENTRYPOINT ["/usr/bin/fast"]

from yijun/fast:base
RUN apk add --update --no-cache --allow-untrusted fast@testing
RUN pip3 install flatast ggnn
WORKDIR /e
ENTRYPOINT ["/usr/bin/fast"]

from yijun/fast:base
RUN apk add --update --no-cache --allow-untrusted fast@testing
RUN pip3 install ggnn
RUN pip3 uninstall -y flatast
RUN pip3 install flatast
WORKDIR /e
ENTRYPOINT ["/usr/bin/fast"]

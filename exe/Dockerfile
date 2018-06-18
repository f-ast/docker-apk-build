FROM fast:yijun
RUN apk update 
RUN apk add -U --allow-untrusted jq perl protobuf bash git python3 py3-pip
WORKDIR /e
ENTRYPOINT ["/usr/bin/fast"]

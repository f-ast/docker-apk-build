FROM gitpod/workspace-full-vnc
RUN for a in musl-1.1.21-r0.apk \
  libgit2-0.27.7-r0.apk \
  sqlite-libs-3.26.0-r3.apk \
  libcurl-7.64.0-r1.apk \
  libcrypto1.1-1.1.1a-r1.apk \
  libssl1.1-1.1.1a-r1.apk \
  zlib-1.2.11-r1.apk \
  libssh2-1.8.0-r4.apk \
  libgcc-8.2.0-r2.apk \
  libstdc++-8.2.0-r2.apk \
  nghttp2-libs-1.36.0-r0.apk \
  libarchive-3.3.2-r4.apk \
  libressl2.7-libcrypto-2.7.4-r2.apk \
  libxml2-2.9.9-r0.apk \
  libacl-2.2.52-r5.apk \
  expat-2.2.6-r0.apk \
  xz-libs-5.2.4-r0.apk \
  lz4-libs-1.8.3-r2.apk \
  libbz2-1.0.6-r6.apk \
  libattr-2.4.47-r7.apk \
  ; do wget http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/$a  && tar xvf /home/gitpod/$a -C /; done \
 && rm -f /home/gitpod/*.apk
RUN for a in \
 antlr4-4.7.2-r0.apk \
 antlr4-dev-4.7.2-r0.apk \
 fast-0.0.8-r0.apk \
 flatbuffers-1.10.0-r0.apk \
 flatbuffers-dev-1.10.0-r0.apk \
 gumtree-2.1.0-r0.apk \
 protobuf-3.6.1-r1.apk \
 srcSlice-1.0-r0.apk \
 srcSlice-dev-1.0-r0.apk \
 srcml-0.9.5-r0.apk \
 srcml-dev-0.9.5-r0.apk \
 ; do wget https://github.com/f-ast/docker-apk-build/blob/fast_docker/fast/target/testing/x86_64/$a?raw=true && tar xvf /home/gitpod/$a\?raw\=true -C /; done \
 && rm -f /home/gitpod/*.apk\?raw\=true
#RUN apt-get update
#RUN apt-get install parallel jq
#RUN pip3 install protobuf flatbuffers tqdm bs4 urllib3
#RUN pip3 install sklearn tensorboardX scipy numpy torch lxml tensorflow

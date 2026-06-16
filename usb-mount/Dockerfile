FROM ghcr.io/home-assistant/base:latest
RUN apk add --no-cache e2fsprogs util-linux
COPY run.sh /
RUN chmod a+x /run.sh

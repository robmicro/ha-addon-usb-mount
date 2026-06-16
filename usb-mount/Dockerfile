FROM alpine:3.21
RUN apk add --no-cache e2fsprogs util-linux bash
COPY run.sh /
RUN chmod a+x /run.sh
CMD ["/run.sh"]

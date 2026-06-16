FROM alpine:3.21
RUN apk add --no-cache e2fsprogs
COPY run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]

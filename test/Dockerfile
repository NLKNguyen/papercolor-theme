FROM alpine:latest

MAINTAINER Nikyle Nguyen <NLKNguyen@MSN.com>

RUN apk add --no-cache vim

RUN mkdir -p /opt/

COPY test.sh /opt/

# Start working at the mounted directory
WORKDIR /mnt

ENTRYPOINT ["/opt/test.sh"]

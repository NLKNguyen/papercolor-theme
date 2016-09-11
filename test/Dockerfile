FROM nlknguyen/alpine-shellcheck

MAINTAINER Nikyle Nguyen <NLKNguyen@MSN.com>

RUN apk add --no-cache vim

RUN mkdir -p /opt/

COPY test.sh /opt/

# Check test script
RUN shellcheck /opt/test.sh

RUN chmod +x /opt/test.sh

# Start working at the mounted directory
WORKDIR /mnt

ENTRYPOINT ["/opt/test.sh"]

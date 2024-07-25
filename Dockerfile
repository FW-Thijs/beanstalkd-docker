FROM alpine:3.20

ENV VERSION_BEANSTALKD="1.13"

RUN addgroup -S beanstalkd  && adduser -S -G beanstalkd beanstalkd
RUN apk add --no-cache "su-exec>=0.2"

RUN apk add beanstalkd

RUN mkdir /data && chown beanstalkd:beanstalkd /data

EXPOSE 11300

ENTRYPOINT ["beanstalkd", "-p", "11300", "-u", "beanstalkd", "-b", "/data"]


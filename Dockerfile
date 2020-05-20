FROM alpine

ENV VERSION eps-v0.2.0
ENV GIT_URL https://github.com/chris-belcher/electrum-personal-server.git

RUN apk update \
  && apk add git \
  && git clone $GIT_URL \
  && cd electrum-personal-server \
  && git checkout $VERSION

EXPOSE 50002

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]

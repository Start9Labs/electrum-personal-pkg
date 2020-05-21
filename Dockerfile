# Builder Stage
FROM alpine AS builder
WORKDIR /root
ENV VERSION eps-v0.2.0
ENV GIT_URL https://github.com/chris-belcher/electrum-personal-server.git
RUN apk update \
  && apk add git \
  && git clone $GIT_URL
WORKDIR electrum-personal-server
RUN git checkout $VERSION

# Target Stage
FROM alpine
WORKDIR /root
ADD ./tmpl /usr/local/bin/tmpl
COPY --from=builder /root/electrum-personal-server ./electrum-personal-server
RUN apk update \
  && apk add python3 \
  && cd electrum-personal-server \
  && pip3 install --upgrade pip \
  && pip3 install wheel \
  && pip3 install .

EXPOSE 50002

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]

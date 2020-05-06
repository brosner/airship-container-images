ARG ARCH=
FROM ${ARCH}ubuntu:focal

RUN set -ex; \
  runtimeDeps='libssl1.1 libsasl2-2 librdkafka1 libyajl2'; \
  buildDeps='curl ca-certificates build-essential zlib1g-dev liblz4-dev libssl-dev libsasl2-dev librdkafka-dev libyajl-dev python cmake'; \
  export DEBIAN_FRONTEND=noninteractive \
  && apt-get update && apt-get install -y $runtimeDeps $buildDeps --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /usr/local/src/kafkacat \
  && cd /usr/local/src/kafkacat \
  && curl -Ls https://github.com/edenhill/kafkacat/archive/1.5.0.tar.gz | tar -zxf - --strip-components=1 \
  && ./configure \
  && make \
  && make install \
  && apt-get purge -y --auto-remove $buildDeps \
  && rm /var/log/dpkg.log /var/log/alternatives.log /var/log/apt/*.log \
  && kafkacat -V

# ENTRYPOINT ["kafkacat"]

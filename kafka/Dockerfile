ARG ARCH=
FROM ${ARCH}ubuntu:focal
ENV PATH=${PATH}:/opt/kafka/bin
RUN apt-get update \
  && apt-get install -y openjdk-8-jre-headless curl \
  && mkdir -p /opt/kafka \
  && curl -Ls http://apache.mirrors.hoobly.com/kafka/2.5.0/kafka_2.12-2.5.0.tgz | tar -xzvf - --strip-components=1 -C /opt/kafka \
  && rm -rf /var/lib/apt/lists/*

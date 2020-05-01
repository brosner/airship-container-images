ARG ARCH=
FROM ${ARCH}ubuntu:focal
ENV PATH=${PATH}:/opt/zookeeper/bin
RUN apt-get update \
  && apt-get install -y openjdk-8-jre-headless curl \
  && mkdir -p /opt/zookeeper \
  && curl -Ls http://archive.apache.org/dist/zookeeper/zookeeper-3.6.1/apache-zookeeper-3.6.1-bin.tar.gz | tar -xzvf - --strip-components=1 -C /opt/zookeeper \
  && rm -rf /var/lib/apt/lists/*

ARG ARCH=
FROM ${ARCH}ubuntu:focal
RUN apt-get update \
  && apt-get install -y openjdk-jre-headless \
  && rm -rf /var/lib/apt/lists/*

ARG ARCH=
FROM ${ARCH}ubuntu:focal
RUN apt-get update \
  && apt-get install -y openjdk-8-jre-headless \
  && rm -rf /var/lib/apt/lists/*

ARG ARCH=
FROM ${ARCH}fluentd:v1.9-debian-1

LABEL maintainer="Brian Rosner <brian@brosner.com>"
USER root
WORKDIR /home/fluent
ENV PATH /fluentd/vendor/bundle/ruby/2.6.0/bin:$PATH
ENV GEM_PATH /fluentd/vendor/bundle/ruby/2.6.0
ENV GEM_HOME /fluentd/vendor/bundle/ruby/2.6.0
ENV FLUENTD_DISABLE_BUNDLER_INJECTION 1

COPY Gemfile* /fluentd/
RUN buildDeps="sudo make gcc g++ libc-dev libffi-dev build-essential autoconf automake libtool pkg-config" \
  runtimeDeps="krb5-kdc libsasl2-modules-gssapi-mit libsasl2-dev " \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends $buildDeps $runtimeDeps net-tools \
  && gem install bundler --version 2.1.2 \
  && bundle config silence_root_warning true \
  && bundle install --gemfile=/fluentd/Gemfile --path=/fluentd/vendor/bundle \
  && SUDO_FORCE_REMOVE=yes \
    apt-get purge \
      -y --auto-remove \
      -o APT::AutoRemove::RecommendsImportant=false \
      $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && gem sources --clear-all \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem  \
  && ldd $(gem contents rdkafka | grep librdkafka.so) | grep libsasl2.so.2

COPY entrypoint.sh /fluentd/entrypoint.sh

ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

# overwrite ENTRYPOINT to run fluentd as root for /var/log / /var/lib
ENTRYPOINT ["tini", "--", "/fluentd/entrypoint.sh"]
CMD ["fluentd"]

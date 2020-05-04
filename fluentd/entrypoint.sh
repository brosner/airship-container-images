#!/bin/sh

if [[ ! -d /var/log/fluentd ]]; then
  mkdir /var/log/fluentd
fi

DEFAULT=/etc/default/fluentd

if [ -r $DEFAULT ]; then
  set -o allexport
  . $DEFAULT
  set +o allexport
fi

# if the user has supplied only arguments append them to `fluentd` command
if [ "${1#-}" != "$1" ]; then
  set -- fluentd "$@"
fi

# if user does not supply config file or plugins, use the default
if [ "$1" = "fluentd" ]; then
  if ! echo $@ | grep ' \-c' ; then
    set -- "$@" -c /fluentd/etc/${FLUENTD_CONF}
  fi
  if ! echo $@ | grep ' \-p' ; then
    set -- "$@" -p /fluentd/plugins
  fi
fi

exec "$@"

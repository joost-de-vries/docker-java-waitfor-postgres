#!/usr/bin/env bash

# this file is used at startup by the docker container to check the availability of postgres
# before starting the given cmd

# see https://docs.docker.com/compose/startup-order/

set -e

host="$1"
#shift
#cmd="$@"
cmd="$2"

until psql -h "$host" -U "${PGUSER}" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping ${PGUSER}"
  sleep 1
done

>&2 echo "Postgres is up - executing command ${cmd}"
exec $cmd

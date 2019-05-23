#!/usr/bin/env bash

set -e

eval "$(jq -r '@sh "HOST=\(.host)"')"

CMD=$(ssh -o StrictHostKeyChecking=no \
  -o UserKnownHostsFile=/dev/null \
  root@$HOST kubeadm token create --print-join-command \
)

jq -n --arg command "$CMD" '{"command":$command}'

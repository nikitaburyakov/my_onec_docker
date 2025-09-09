#!/bin/bash
/tmp/esb/1ce-installer-cli query installed > /tmp/params.yaml
ID=$(yq -r '.id' /tmp/params.yaml)
VERSION=$(yq -r '.version' /tmp/params.yaml)
ARCH=$(yq -r '.arch' /tmp/params.yaml)

ESB_BIN="/opt/1C/1CE/components/$ID-$VERSION-$ARCH/bin/esb"
INSTANCE_DIR="/var/opt/1C/1CE/instances/$ID"

if [ ! -x "$ESB_BIN" ]; then
  echo "Файл не найден или не исполняемый: $ESB_BIN" >&2
  exit 1
fi

exec "$ESB_BIN" start --instance="$INSTANCE_DIR" "$@"

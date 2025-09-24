#!/bin/bash
/tmp/esb/1ce-installer-cli query installed > /tmp/params.yaml
ESB_ID=$(yq -r '.id' /tmp/params.yaml)
ESB_VERSION=$(yq -r '.version' /tmp/params.yaml)
ESB_ARCH=$(yq -r '.arch' /tmp/params.yaml)

export ESB_BIN=$(find $ESBDIR/components/ -name 'esb' | head -n 1)

export INSTANCE_DIR="/var/opt/1C/1CE/instances/$ESB_ID"

if [ -f $(find $INSTANCE_DIR -name "*.pid") ]; then
    PIDFILE=$(find $INSTANCE_DIR -name "*.pid")
    rm $PIDFILE
fi

exec "$ESB_BIN" start --instance="$INSTANCE_DIR" "$@"
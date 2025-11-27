#!/bin/bash

source ../ENV

# Strip directory prefix
DEBUGGEE_APPLICATION="$(basename "${ENV_DEBUGGEE_APPLICATION}")"
GDBSERVER_CMD="\
    gdbserver :${ENV_DEBUGGER_GDBSERVER_PORT} \
    ${ENV_APPLICATION_UPLOAD_PATH}${DEBUGGEE_APPLICATION} \
    ${ENV_DEBUGGEE_CMDLINE_ARGS} \
"

echo "Executing on ${ENV_TARGET_SSH_HOST}"
echo "  $ ${GDBSERVER_CMD}"
echo "Waiting..."

ssh ${ENV_TARGET_SSH_HOST} -f ${GDBSERVER_CMD}
sleep 1

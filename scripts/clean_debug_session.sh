#!/bin/bash

source include/get_app_path.inc
source ../ENV

DEBUGGEE_APPLICATION="$(basename "${ENV_DEBUGGEE_APPLICATION}")"

STOP_GDBSERVER_CMD="killall gdbserver > /dev/null 2>&1 &"
REMOVE_DEBUGGEE_CMD="rm -f \
    ${ENV_APPLICATION_UPLOAD_PATH}${DEBUGGEE_APPLICATION} \
    ${ENV_LIBS_UPLOAD_PATH}/* \
"

ssh ${ENV_TARGET_SSH} -f ${STOP_GDBSERVER_CMD}
ssh ${ENV_TARGET_SSH} -f ${REMOVE_DEBUGGEE_CMD}

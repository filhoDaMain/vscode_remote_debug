#!/bin/bash

source include/files.inc
source ../ENV

GDBINIT_INC="./include/gdbinit.inc"
GDBINIT="../gdbinit"

DEBUGGEE_LIBS=
if [ -n "${ENV_DEBUGGEE_LIBS_PATH}" ]; then
    DEBUGGEE_LIBS=$(get_file_abs_path ${ENV_DEBUGGEE_LIBS_PATH})
fi

CONNECT_PORT=
if [ -n "${ENV_PORTFWD_LOCAL_PORT}" ]; then
    CONNECT_PORT=${ENV_PORTFWD_LOCAL_PORT}
else
    CONNECT_PORT=${ENV_DEBUGGER_GDBSERVER_PORT}
fi

sed \
-e "s#ENV_STOP_AT#${ENV_STOP_AT}#g" \
-e "s#ENV_DEBUGGER_SYSROOT#${ENV_DEBUGGER_SYSROOT}#g" \
-e "s#DEBUGGEE_LIBS#${DEBUGGEE_LIBS}#g" \
-e "s#ENV_TARGET_IPADDR#${ENV_TARGET_IPADDR}#g" \
-e "s#CONNECT_PORT#${CONNECT_PORT}#g" \
${GDBINIT_INC} > ${GDBINIT}

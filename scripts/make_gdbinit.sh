#!/bin/bash

source include/get_app_path.inc
source ../ENV

GDBINIT_INC="./include/gdbinit.inc"
GDBINIT="../gdbinit"

DEBUGGEE_LIBS=
if [ -n "${ENV_DEBUGGEE_LIBS_PATH}" ]; then
    DEBUGGEE_LIBS=$(get_app_path ${ENV_DEBUGGEE_LIBS_PATH})
fi


sed \
-e "s#ENV_STOP_AT#${ENV_STOP_AT}#g" \
-e "s#ENV_DEBUGGER_SYSROOT#${ENV_DEBUGGER_SYSROOT}#g" \
-e "s#DEBUGGEE_LIBS#${DEBUGGEE_LIBS}#g" \
-e "s#ENV_TARGET_IPADDR#${ENV_TARGET_IPADDR}#g" \
-e "s#ENV_DEBUGGER_GDBSERVER_PORT#${ENV_DEBUGGER_GDBSERVER_PORT}#g" \
${GDBINIT_INC} > ${GDBINIT}

#!/bin/bash

source include/files.inc
source ../ENV

# Stop gdb server in remote target
STOP_GDBSERVER_CMD="killall gdbserver > /dev/null 2>&1 &"
ssh ${ENV_TARGET_SSH_HOST} -f ${STOP_GDBSERVER_CMD}

# Remove companion libs in remote target
DEBUGGEE_LIBS_ABSPATH=
DEBUGGEE_LIBS=
if [ -n "${ENV_DEBUGGEE_LIBS_PATH}" ]; then
    # Get array of uploaded libraries
    DEBUGGEE_LIBS_ABSPATH=$(get_file_abs_path ${ENV_DEBUGGEE_LIBS_PATH})
    mapfile -d '' -t DEBUGGEE_LIBS < <(get_files_in_directory "${DEBUGGEE_LIBS_ABSPATH}")

    # Remove one by one
    for library in "${DEBUGGEE_LIBS[@]}"; do
        library_basename="$(basename "${library}")"
        REMOVE_LIBRARY_CMD="rm ${ENV_LIBS_UPLOAD_PATH}/${library_basename}"
        ssh ${ENV_TARGET_SSH_HOST} -f ${REMOVE_LIBRARY_CMD}
    done
fi

# Remove application
DEBUGGEE_APPLICATION="$(basename "${ENV_DEBUGGEE_APPLICATION}")"
REMOVE_DEBUGGEE_CMD="rm ${ENV_APPLICATION_UPLOAD_PATH}${DEBUGGEE_APPLICATION}"
ssh ${ENV_TARGET_SSH_HOST} -f ${REMOVE_DEBUGGEE_CMD}

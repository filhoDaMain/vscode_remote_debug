#!/bin/bash

source include/files.inc
source ../ENV

CREATE_APPLICATION_UPLOAD_PATH_CMD="mkdir -p ${ENV_APPLICATION_UPLOAD_PATH}"
DEBUGGEE_APPLICATION=$(get_file_abs_path ${ENV_DEBUGGEE_APPLICATION})

CREATE_LIBS_UPLOAD_PATH_CMD="mkdir -p ${ENV_LIBS_UPLOAD_PATH}"
DEBUGGEE_LIBS_ABSPATH=
DEBUGGEE_LIBS=

if [ -n "${ENV_DEBUGGEE_LIBS_PATH}" ]; then
    # Create directory to upload libs, if it does not exist yet in remote target
    ssh ${ENV_TARGET_SSH_HOST} -f ${CREATE_LIBS_UPLOAD_PATH_CMD}

    # Get array of libary files to upload
    DEBUGGEE_LIBS_ABSPATH=$(get_file_abs_path ${ENV_DEBUGGEE_LIBS_PATH})
    mapfile -d '' -t DEBUGGEE_LIBS < <(get_files_in_directory "${DEBUGGEE_LIBS_ABSPATH}")

    # Upload one by one
    for library in "${DEBUGGEE_LIBS[@]}"; do
        scp $library ${ENV_TARGET_SSH_HOST}:${ENV_LIBS_UPLOAD_PATH}
    done
fi

# Create directory to upload application, if it does not exist yet in remote target
ssh ${ENV_TARGET_SSH_HOST} -f ${CREATE_APPLICATION_UPLOAD_PATH_CMD}

# Upload application to debug
scp ${DEBUGGEE_APPLICATION} ${ENV_TARGET_SSH_HOST}:${ENV_APPLICATION_UPLOAD_PATH}

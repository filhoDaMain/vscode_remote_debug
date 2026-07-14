#!/bin/bash

_priv_is_abs_path()
{
    if [[ "$1" = /* ]]; then
        return 0
    else
        return 1
    fi
}

_priv_get_abs_path()
{
    WORKSPACE_BASEDIR=$(cd ../../ && pwd)
    echo "${WORKSPACE_BASEDIR}/$1"
}

# Get absolute path to $1
get_file_abs_path()
{
    APP="$1"
    _priv_is_abs_path ${APP}
    if [ $? -eq 0 ]; then
        APP="${APP}"
    else
       APP=$(_priv_get_abs_path ${APP})
    fi
    echo "${APP}"
}

# Get list of files inside $1 directory
get_files_in_directory()
{
    local dir="$1"
    find "$dir" -maxdepth 1 -type f -print0
}

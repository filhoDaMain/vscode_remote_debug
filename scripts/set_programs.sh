#!/bin/bash

source include/get_app_path.inc
source ../ENV

MIDEBUGGER_SYMLINK="../cross-debugger"
PROGRAM_SYMLINK="../program"


rm -f ${MIDEBUGGER_SYMLINK}
rm -f ${PROGRAM_SYMLINK}
ln -s ${ENV_DEBUGGER} ${MIDEBUGGER_SYMLINK}
ln -s $(get_app_path ${ENV_DEBUGGEE_APPLICATION}) ${PROGRAM_SYMLINK}

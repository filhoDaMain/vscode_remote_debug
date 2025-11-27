define setup_session
    break ENV_STOP_AT
    set sysroot ENV_DEBUGGER_SYSROOT
    set solib-search-path DEBUGGEE_LIBS
    set substitute-path /usr/src/debug ENV_DEBUGGER_SYSROOT/usr/src/debug
end

define connect
    target remote ENV_TARGET_IPADDR:ENV_DEBUGGER_GDBSERVER_PORT
end

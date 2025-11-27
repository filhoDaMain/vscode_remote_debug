**ENV_DEBUGGEE_APPLICATION**

- Path to the executable binary being debugged </br>
- Can be specified as an absolute path or as relative to project's base directory (one level above .vscode/)

Example:
```bash
# as a path relative to project's base directory /home/foo/hello/
export ENV_DEBUGGEE_APPLICATION="out/debug/bin/helloworld"

# assumed to be absolute if begins with "/"
export ENV_DEBUGGEE_APPLICATION="/home/foo/hello/out/debug/bin/helloworld"
```
</br>

**ENV_DEBUGGEE_CMDLINE_ARGS**
- Optional command line arguments passed to `ENV_DEBUGGEE_APPLICATION` when launching
- Leave empty if no command line arguments are needed
</br></br>


**ENV_APPLICATION_UPLOAD_PATH**
- Path where to upload **ENV_DEBUGGEE_APPLICATION**
- Specified as a **scp** destination

Example:
```bash
# Upload to /home/<user>/bin/
export ENV_APPLICATION_UPLOAD_PATH="bin/"

# Upload to /usr/bin/
export ENV_APPLICATION_UPLOAD_PATH="/usr/bin/"
```
</br>

**ENV_DEBUGGEE_LIBS_PATH**
- Optional path to a directory containing libraries to upload
- Leave `empty` if no libraries are needed
- Like `ENV_DEBUGGEE_APPLICATION`, can be specified as an absolute path or as relative to project's base directory

Example:
```bash
# Don't upload any optional files
export ENV_DEBUGGEE_LIBS_PATH=""

# All files from this dir will be uploaded
export ENV_DEBUGGEE_LIBS_PATH="out/debug/lib/"
```
</br>

**ENV_LIBS_UPLOAD_PATH**
- Path where to upload files from **ENV_DEBUGGEE_LIBS_PATH**
- Specified as a **scp** destination
</br></br>

**ENV_TARGET_SSH_HOST**
- A target host from ~/.ssh/config

*HINT*: setup ssh key login in target
</br></br>

**ENV_TARGET_IPADDR**
- Target's address specified as an IP Address or as hostname from /etc/hosts

*NOTE*: I like to setup ~/.ssh/config hosts with the same name as the respective /etc/hosts hostname, so you will likely
find in my examples `ENV_TARGET_SSH_HOST` and `ENV_TARGET_IPADDR` with the same value
</br></br>

**ENV_STOP_AT**
- Optional GDB breakpoint
- Useful to setup as an entrypoint breakpoint like `main` or libc's `_start`

Example:
```bash
# Stop at main()
export ENV_STOP_AT="main"
```
</br>

**ENV_DEBUGGER**
- Absolute path to a valid cross-debugger from HOST

Example:
```bash
# GDB from a Yocto Toolchain
export ENV_DEBUGGER=/opt/pokytos/1.0.0/sysroots/aarch64-pokytossdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb
```
</br>

**ENV_DEBUGGER_SYSROOT**
- Absolute path to a target sysroot

Example:
```bash
# Sysroot from a Yocto Toolchain
export ENV_DEBUGGER_SYSROOT="/opt/pokytos/1.0.0/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi"
```
</br>

**ENV_DEBUGGER_GDBSERVER_PORT**
- A port number which `gdbserver` will listen to for remote connections
- Any available port number should work (`1234` is typically a good one)
